class Review < ApplicationRecord
  belongs_to :user
  belongs_to :beer

  validates :rating, presence: true, numericality: { only_integer: true, in: 1..5 }
  validates :body, presence: true, length: { minimum: 10 }
end