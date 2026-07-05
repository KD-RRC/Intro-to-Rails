class Hop < ApplicationRecord
  has_many :beer_hops, dependent: :destroy
  has_many :beers, through: :beer_hops
end