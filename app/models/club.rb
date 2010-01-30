class Club < ActiveRecord::Base
  belongs_to :user, :foreign_key => :owner_id
  has_many :memberships
  has_many :members, :through => :memberships, :conditions => "status = 'accepted'", :source => 'user'
  has_many :pending_members, :through => :memberships, :conditions => "status = 'pending'", :source => 'user'

  has_attached_file :logo,
    :styles => {
    :full => "800x600>",
    :thumb => "120x100#",
    :club => "265x200#"
  }

  default_scope :order => 'created_at DESC'

  attr_accessible :name, :short_description, :description, :logo
end
