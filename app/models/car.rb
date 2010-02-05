class Car < ActiveRecord::Base
  belongs_to :user
  attr_accessible :genre, :name, :user_id, :gallery_id, :make, :age_grade, :ccm, :performance,
    :fuel, :acceleration, :topspeed, :torque, :color, :description, :interior, :exterior, :engine,
    :audio
  has_many :carimages
  has_many :carcomments
  default_scope :order => 'ordinal ASC'

  ajaxful_rateable :stars => 10
  
end
