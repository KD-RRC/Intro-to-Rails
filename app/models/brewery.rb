class Brewery < ApplicationRecord
  has_many :beers, dependent: :destroy

  validates :name, presence: true
  validates :brewery_type, presence: true
  validates :latitude, numericality: true, allow_nil: true
  validates :longitude, numericality: true, allow_nil: true
end