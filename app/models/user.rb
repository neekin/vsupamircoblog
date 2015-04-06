class User < ActiveRecord::Base

  has_many:mircoblogs
  has_many:comments
  has_secure_password
  validates :username ,presence: true
  validates :username , uniqueness: { case_sensitive: false}
  mount_uploader :avatar, AvatarUploader
  #添加用户验证
  before_create { generate_token(:auth_token) }

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column =>self[column])
  end
end
