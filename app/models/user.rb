class User < ApplicationRecord

  has_secure_password

  before_save :downcase_email

  #attr_accessor :email, :password_digest

  validates :email, presence: true

  private

  def downcase_email
    self.email.downcase
  end
end