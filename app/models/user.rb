class User < ActiveRecord::Base
  attr_accessible :email, :username, :password, :password_confirmation
  has_secure_password

  before_save do |user| 
    user.email = email.downcase
    user.username = username.downcase
  end

  validates_presence_of :email, :username
  
  validates_length_of :username, :maximum => 12
  validates_uniqueness_of :username, :case_sensitive => false
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates_format_of :email, :with => VALID_EMAIL_REGEX
  validates_uniqueness_of :email, :case_sensitive => false
  
  validates :password, presence: true, length: { minimum: 6 }

  
end
