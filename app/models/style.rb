class Style < ApplicationRecord
  has_many :beers, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end