class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true, length: {maximum: Settings.validates_name}
  validates :email, presence: true, length: {maximum: Settings.validates_email},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, presence: true,
    length: {minimum: Settings.validates_password}
    
  before_save :downcase_email

  has_secure_password

  private

  def downcase_email
    email.downcase!
  end
end
