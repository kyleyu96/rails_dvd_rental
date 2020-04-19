class Category < ApplicationRecord
  has_many :movie_categories
  has_many :movies, through: :movie_categories
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  default_scope -> { order(name: :asc) }
end