class Car < ActiveRecord::Base
  belongs_to :user
  attr_accessible :genre, :name, :make, :age_grade, :ccm, :performance,
    :fuel, :acceleration, :topspeed, :torque, :color, :description, :interior,
    :exterior, :engine, :audio
  has_many :carimages
  has_many :carcomments
  default_scope :order => 'ordinal ASC'

  ajaxful_rateable :stars => 10

  def invitable?
    not Combat.find_by_challenger_id(self.id) || Combat.find_by_invited_id(self.id)
  end
  
end
