class User < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :beers, through: :reviews
end