class Page < ActiveRecord::Base
  has_permalink :permalink

  def to_param
    permalink.blank? ? id : permalink
  end
end
