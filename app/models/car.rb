class Car < ActiveRecord::Base
  belongs_to :user
  attr_accessible :genre, :name, :user_id, :gallery_id, :make, :age_grade, :ccm, :performance,
      :fuel, :acceleration, :topspeed, :torque, :color, :description
  has_many :carimages
end
