class Carimage < ActiveRecord::Base
  belongs_to :car
  validates_presence_of     :image
  has_attached_file :image,
    :path => ":rails_root/public/system/carimages/:id/:style/:basename.:extension",
    # :processors => [:watermark],
  :url  => "/system/carimages/:id/:style/:basename.:extension",
    :styles => {
    :full => "800x600>",
    :thumb => "120x100#",
    :car => "265x200>"
  }
  #:full => {
  #  :geometry => "800x600>",
  #  :watermark_path => "#{RAILS_ROOT}/public/images/watermark.png",
  #},
  #:thumb => "120x100#",
  #:car => {
  #  :geometry => "265x200>",
  #  :watermark_path => "#{RAILS_ROOT}/public/images/watermark_small.png",
  #}
  #}
  attr_accessible :title, :image
  default_scope :order => 'ordinal ASC'

  # Set passed-in order for passed-in ids.
  def self.order(ids)
    update_all(
      ['ordinal = FIND_IN_SET(id, ?)', ids.join(',')],
      { :id => ids }
    )
  end

end
