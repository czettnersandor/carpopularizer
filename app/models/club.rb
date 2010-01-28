class Club < ActiveRecord::Base
  belongs_to :user, :foreign_key => :owner_id

  has_attached_file :logo,
    :styles => {
    :full => "800x600>",
    :thumb => "120x100#",
  }
end
