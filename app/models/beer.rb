class Beer < ApplicationRecord
  belongs_to :brewery
  belongs_to :style
  has_many :reviews, dependent: :destroy
  has_many :users, through: :reviews
  has_many :beer_hops, dependent: :destroy
  has_many :hops, through: :beer_hops
end