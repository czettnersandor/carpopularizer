class Carcomment < ActiveRecord::Base
  belongs_to :car
  belongs_to :user
end
