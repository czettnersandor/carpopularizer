class Advert < ActiveRecord::Base
  has_many :carimages
  belongs_to :user
  default_scope :order => 'created_at DESC'
end
