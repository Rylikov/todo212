class User < ApplicationRecord
  has_many  :task
  validates :name,      presence: true
  validates :email,     presence: true, uniqueness: { case_sensitive: false, message: "This user has already registered" }
  validates :password,  presence: true, confirmation: true, length: { minimum: 6, message: "Password must be 6 chars or more" }
  validates :password_confirmation,  presence: true
  has_secure_password
end
