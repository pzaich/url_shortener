class User < ActiveRecord::Base
  attr_accessible :email, :username
  validates_presence_of :email, :username
  
  validates_format_of :email, :with /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/
  validates_length_of :username, :maximum => 12
  validates_presence_of :email, :username
end
