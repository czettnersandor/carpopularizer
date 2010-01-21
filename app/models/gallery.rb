class Gallery < ActiveRecord::Base
  default_scope :order => 'created_at DESC'
  belongs_to :user
  has_many :images
end
