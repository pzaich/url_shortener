class User < ActiveRecord::Base
  attr_accessible :email, :username
  validates_presence_of :email, :username
  
end
