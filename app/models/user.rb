class User < ApplicationRecord
  has_secure_password
  has_many :answers, dependent: :destroy
  has_many :questions, dependent: :destroy

  validates :username, :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 2 }

end
