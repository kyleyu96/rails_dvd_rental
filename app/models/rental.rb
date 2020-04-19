class Rental < ApplicationRecord
  belongs_to :customer
  belongs_to :movie
  default_scope -> { order(created_at: :desc) }
end