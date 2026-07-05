class BeerHop < ApplicationRecord
  belongs_to :beer
  belongs_to :hop

  validates :beer_id, presence: true
  validates :beer_id, uniqueness: { scope: :hop_id }
end
