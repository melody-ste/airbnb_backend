class Listing < ApplicationRecord
  validates :available_beds, presence: true, numericality: { greater_than: 0 }
  validates :description, presence: true, length: { minimum: 140 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :welcome_message, presence: true

  has_many :reservations
  belongs_to :admin, class_name: "User", foreign_key: "admin_id"
  belongs_to :city
  
end
