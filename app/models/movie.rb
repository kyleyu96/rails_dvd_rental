class Movie < ApplicationRecord
  has_many :rentals
  has_many :movie_categories
  has_many :categories, through: :movie_categories
  validates :title, :year, :summary, :poster_url, presence: true
  validates :max_quantity, numericality: { greater_than: 0 }
  validates :current_inventory, numericality: { greater_than_or_equal_to: 0 }
  default_scope -> { order(year: :desc, created_at: :desc) }
  default_scope -> { order(last_name: :asc, first_name: :asc) }
end