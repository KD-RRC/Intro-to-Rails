class Beer < ApplicationRecord
  belongs_to :brewery
  belongs_to :style
  has_many :reviews, dependent: :destroy
  has_many :users, through: :reviews
  has_many :beer_hops, dependent: :destroy
  has_many :hops, through: :beer_hops

  validates :name, presence: true
  validates :abv, numericality: { greater_than_or_equal_to: 0, less_than: 1 }, allow_nil: true
end