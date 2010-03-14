class Image < ActiveRecord::Base
  belongs_to :gallery
  validates_presence_of     :image
  has_attached_file :image,
    # :processors => [:watermark],
  :styles => {
    :full => "800x600>",
    #:full => {
    #  :geometry => "800x600>",
    #  :watermark_path => "#{RAILS_ROOT}/public/images/watermark.png",
    #},
    :thumb => "120x100#"
  }
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
