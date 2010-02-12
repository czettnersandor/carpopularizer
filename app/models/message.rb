class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :sender, :class_name => "User", :foreign_key => :sender_id
  attr_accessible :body
end
