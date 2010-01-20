class Car < ActiveRecord::Base
  belongs_to :user
  belongs_to :gallery
  attr_accessible :genre, :name, :user_id, :gallery_id, :make, :age_grade, :ccm, :performance,
      :fuel, :acceleration, :topspeed, :torque, :color
end