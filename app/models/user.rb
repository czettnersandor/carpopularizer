require 'digest/sha1'
include GeoKit::Geocoders
include GeoKit::Mappable
class User < ActiveRecord::Base
  has_and_belongs_to_many :roles

  has_many :friends, :through => :friendships, :conditions => "status = 'accepted'"
  has_many :requested_friends, :through => :friendships, :source => :friend, :conditions => "status = 'requested'", :order => "friendships.created_at"
  has_many :pending_friends, :through => :friendships, :source => :friend, :conditions => "status = 'pending'", :order => "friendships.created_at"
  has_many :friendships, :dependent => :destroy
  has_many :memberships
  has_many :clubs, :through => :memberships, :conditions => "status = 'accepted'"
  has_many :requested_clubs, :through => :memberships, :conditions => "status = 'pending'"
  has_many :galleries
  has_many :cars
  has_many :comments
  has_many :carcomments
  has_many :rates # ajaxful-rating
  has_many :messages
  has_many :messages_sent, :class_name => "Message", :foreign_key => :sender_id
  has_many :cups
  has_many :userevents
  
  # Virtual attribute for the unencrypted password
  attr_accessor :password

  #Avatar image and thumbnails
  has_attached_file :avatar,
    :styles => { :medium => "300x300#",
    :thumb => "69x50#" },
    :default_url => "/system/:attachment/missing_:style.png"

  validates_presence_of     :login, :email
  validates_presence_of     :password,                   :if => :password_required?
  validates_presence_of     :password_confirmation,      :if => :password_required?
  validates_length_of       :password, :within => 5..40, :if => :password_required?
  validates_confirmation_of :password,                   :if => :password_required?
  validates_length_of       :login,    :within => 3..40
  validates_length_of       :email,    :within => 3..100
  validates_uniqueness_of   :login, :email, :case_sensitive => false
  before_save :encrypt_password
  before_create :make_activation_code
  
  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.
  attr_accessible :login, :email, :password, :password_confirmation,
    :address, :birth, :name, :city, :nem, :zip, :country, :langs, :about, :phone, :avatar,
    :website, :nyitvatartas, :contact_person, :contact_phone, :usertype

  acts_as_mappable :default_units => :kms,
    :default_formula => :sphere,
    :distance_field_name => :distance,
    :lat_column_name => :lat,
    :lng_column_name => :lng
  before_validation :geocode_address

  def update_last_login
    self.last_login = Time.now.utc
    save(false)
  end
  
  # Activates the user in the database.
  def activate
    @activated = true
    self.activated_at = Time.now.utc
    self.activation_code = nil
    save(false)
  end

  def active?
    # the existence of an activation code means they have not activated yet
    activation_code.nil?
  end

  def pending?
    @activated
  end

  # Authenticates a user by their login name and unencrypted password.  Returns the user or nil.
  def self.authenticate(login, password)
    u = find :first, :conditions => ['email = ? and activated_at IS NOT NULL', login] # need to get the salt
    u && u.authenticated?(password) ? u : nil
  end

  # Encrypts some data with the salt.
  def self.encrypt(password, salt)
    Digest::SHA1.hexdigest("--#{salt}--#{password}--")
  end

  # Encrypts the password with the user salt
  def encrypt(password)
    self.class.encrypt(password, salt)
  end

  def authenticated?(password)
    crypted_password == encrypt(password)
  end

  def remember_token?
    remember_token_expires_at && Time.now.utc < remember_token_expires_at 
  end

  # These create and unset the fields required for remembering users between browser closes
  def remember_me
    remember_me_for 2.weeks
  end

  def remember_me_for(time)
    remember_me_until time.from_now.utc
  end

  def remember_me_until(time)
    self.remember_token_expires_at = time
    self.remember_token            = encrypt("#{email}--#{remember_token_expires_at}")
    save(false)
  end

  def forget_me
    self.remember_token_expires_at = nil
    self.remember_token            = nil
    save(false)
  end

  # Returns true if the user has just been activated.
  def recently_activated?
    @activated
  end

  def forgot_password
    @forgotten_password = true
    self.make_password_reset_code
  end

  def reset_password
    # First update the password_reset_code before setting the
    # reset_password flag to avoid duplicate email notifications.
    update_attribute(:password_reset_code, nil)
    @reset_password = true
  end

  #used in user_observer
  def recently_forgot_password?
    @forgotten_password
  end

  def recently_reset_password?
    @reset_password
  end

  def self.find_for_forget(email)
    find :first, :conditions => ['email = ? and activated_at IS NOT NULL', email]
  end

  def has_role?(rolename)
    self.roles.find_by_rolename(rolename) ? true : false
  end

  protected
  # before filter
  def encrypt_password
    return if password.blank?
    self.salt = Digest::SHA1.hexdigest("--#{Time.now.to_s}--#{login}--") if new_record?
    self.crypted_password = encrypt(password)
  end
      
  def password_required?
    crypted_password.blank? || !password.blank?
  end
    
  def make_activation_code
    self.activation_code = Digest::SHA1.hexdigest( Time.now.to_s.split(//).sort_by {rand}.join )
  end

  def make_password_reset_code
    self.password_reset_code = Digest::SHA1.hexdigest( Time.now.to_s.split(//).sort_by {rand}.join )
  end

  private

  def geocode_address
    if city && address
      coordinates = GoogleGeocoder.geocode(zip+' '+city+' '+address)
      self.lat, self.lng = coordinates.lat,coordinates.lng if coordinates.success
    end
  end
    
end
