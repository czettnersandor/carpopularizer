class Carcomment < ActiveRecord::Base
  belongs_to :car
  belongs_to :user

  attr_accessible :body, :reply_to
end
