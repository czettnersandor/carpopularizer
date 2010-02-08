class Combat < ActiveRecord::Base
  belongs_to :challenger, :class_name => "Car", :foreign_key => :challenger_id
  belongs_to :invited, :class_name => "Car", :foreign_key => :invited_id
end
