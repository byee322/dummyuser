class User < ActiveRecord::Base
  has_secure_password
  # Remember to create a migration!
  validates_presence_of :email
  validates :email, uniqueness: true

  # before_save :encrypt_password

  attr_accessible :email, :password


  # def encrypt_password
  #   p password
  #   self.password_digest = "randompassword"
  #   p self.password_digest = has_secure_password(password)
  # end

  # def encrypt(string)
  # 	string.reverse
  # end

  # def self.authenticate(email, password)
  #   user = self.find_or_create_by_email_and_password(email, password) do |u|
  #     u.password = has_secure_password(password)
  #   end
  #   user.secure_password == encrypt(password) ? true : false
  # end
end