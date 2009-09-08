require 'digest/sha1'

class User < ActiveRecord::Base
  attr_accessor :password_confirmation

  validates_presence_of :name
  validates_presence_of :password
  validates_confirmation_of :password

  def self.authenticate(name, pwd)
    user = User.find_by_name(name)
    if user
      expected_password = encrypted_password(pwd, user.salt)
      if user.hashed_password != expected_password
        user = nil
      end
    end
    user
  end

  def password
    @password
  end

  def password=(pwd)
    @password = pwd
    return if pwd.blank?
    create_new_salt
    self.hashed_password = User.encrypted_password(self.password, self.salt)
  end

  def create_new_salt
    self.salt = self.object_id.to_s + rand.to_s
  end

  def self.encrypted_password(pwd, salt)
    string_to_hash = pwd + "test" + salt
    Digest::SHA1.hexdigest(string_to_hash)
  end

  def before_create
    self.state ||= 0
    self.remark = "无" if self.remark.blank?
  end

end
