class Shout < ActiveRecord::Base
  belongs_to :user
  belongs_to :club

  validates_presence_of :message

  def self.all_shouts(club_id)
    Shout.find(:all, :limit => 25, :order => 'created_at DESC', :conditions => ["club_id = ?", club_id])
  end

end
