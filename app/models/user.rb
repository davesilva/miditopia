class User < ActiveRecord::Base
  attr_accessible :email, :username, :password, :password_confirmation
  has_secure_password

  before_save :create_remember_token, :store_login_name

  has_many :tracks, :dependent => :destroy
  has_many :comments, :dependent => :destroy

  validates :email, :uniqueness => {:case_sensitive => false}, :presence => true
  validates :username, :uniqueness => {:case_sensitive => false}, :presence => true
  validates :password, :presence => true, :unless => :password_digest?
  validates :password, :length => {:minimum => 6}, :allow_blank => true
  validates :password_confirmation, :presence => true, :unless => :password_digest?


private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end

  def store_login_name
    self.login_name = self.username.downcase
  end

end
