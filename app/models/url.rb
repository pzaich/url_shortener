class Url < ActiveRecord::Base
  attr_accessible :full_url
  
  validates_format_of :full_url, :with => /^http/
end
