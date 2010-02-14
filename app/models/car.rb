class Car < ActiveRecord::Base
  belongs_to :user
  attr_accessible :genre, :name, :make, :age_grade, :ccm, :performance,
    :fuel, :acceleration, :topspeed, :torque, :color, :description, :interior,
    :exterior, :engine, :audio
  has_many :carimages
  has_many :carcomments
  has_many :combat_votes, :foreign_key => :voted_car

  default_scope :order => 'ordinal ASC'

  ajaxful_rateable :stars => 10, :cache_column => :rating_average

  def invitable?
    not Combat.find_by_challenger_id(self.id) || Combat.find_by_invited_id(self.id)
  end

  def all_combats
    Combat.find_all_by_challenger_id(id) + Combat.find_all_by_invited_id(id)
  end

  def self.top5 # Class method
    find(:all, :order => "rating_average DESC", :limit => 5, :include => [:carimages, :user])
  end
  
end
