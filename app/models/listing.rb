class Listing < ApplicationRecord
  validate :available_beds, :presence true
  validate :description, presence: true
  has_many :reservations
  has_many :users, through: :reservations
  belongs_to :city
end
