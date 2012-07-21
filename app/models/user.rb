class User < ActiveRecord::Base
  attr_accessible :email, :username
  validates_presence_of :email, :username
  
  validates_length_of :username, :maximum => 12
  validates_uniqueness_of :email, :case_sensitive => false
  validates_uniqueness_of :username, :case_sensitive => false

  validates :password, :presence => true, :confirmation => true, :length => {:within => 6..20}

  before_save :encrypt_password

  def has_password?(submitted_pass)
  	encrypted_password ==encrypt(submitted_pass)
  end

  def self.authenticate(email, submitted_pass)
  	user = find_by_email(email)
  	return nil if user.nil?
  	return user if user.has_password?(submitted_pass)
  end

  private 

  	def encrypt_password
  		self.salt = make_salt unless has_password?(self.password)
  		self.encrypted_password = encrypt(self.password)
  	end

  	def encrypt(string)
  		secure_hash("#{self.salt}--#{string}")
  	end

  	def make_salt
  		secure_hash("#{Time.now.utc}--#{password}")
  	end

  	def secure_hash(string)
  		Digest::SHA2.hexdigest(string)
  	end

end
