class Url < ActiveRecord::Base
  attr_accessible :full_url, :vanity
  validates_format_of :full_url, :with => /^http:\/\//
  validates_uniqueness_of :vanity, :allow_blank => true 
  validates_format_of :vanity, :without => /^\d/
  
  def self.find(input)
     if input.class.to_s == "Symbol"
       super
     else
       (input.to_i == 0 ? find_by_vanity(input) : super)
     end
  end
end
