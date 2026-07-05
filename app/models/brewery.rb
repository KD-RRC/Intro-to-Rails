class Brewery < ApplicationRecord
  has_many :beers, dependent: :destroy
end