class User < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :beers, through: :reviews

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end