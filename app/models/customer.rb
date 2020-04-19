class Customer < ApplicationRecord
  has_many :rentals
  validates :first_name, :last_name, :phone, :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  default_scope -> { order(last_name: :asc, first_name: :asc) }
end