class Advert < ActiveRecord::Base
  has_many :carimages
  default_scope :order => 'created_at DESC'
end
