class BeerHop < ApplicationRecord
  belongs_to :beer
  belongs_to :hop
end
