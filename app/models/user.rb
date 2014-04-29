class User < ActiveRecord::Base
  attr_accessor :password
  before_save :encrypt_password

  validates :username, :presence => true, :uniqueness => true, :length => { :in => 2..20 }
  validates :email, :presence => true, :uniqueness => true
  validates :password, :presence => true, :length => 6..30, :confirmation => true #password_confirmation attr

  def self.authenticate(email, password)
  user = find_by_email(email)
  if user && user.encrypted_password == BCrypt::Engine.hash_secret(password, user.salt) 
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.encrypted_password = BCrypt::Engine.hash_secret(password, salt)
    end
  end
end
