class Url < ActiveRecord::Base
  attr_accessible :full_url, :vanity
  validates_format_of :full_url, :with => /^http:\/\//
  validates_uniqueness_of :vanity
  validates_format_of :vanity, :without => /^\d/
  
  def self.find(input)
    unless input ==  :all
      input.to_i == 0 ? find_by_vanity(input) : super
    else
      super
    end
  end
end
