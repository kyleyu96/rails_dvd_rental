class Movie < ApplicationRecord
  has_many :rentals
  has_many :movie_categories
  has_many :categories, through: :movie_categories
  validates :title, :year, :summary, presence: true
  validates :max_quantity, numericality: { greater_than: 0 }
  validates :current_inventory, numericality: { greater_than_or_equal_to: 0 }
  default_scope -> { order(created_at: :desc) }
end