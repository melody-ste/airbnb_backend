class Listing < ApplicationRecord
  validates :available_beds, presence: true, numericality: { greater_than: 0 }
  validates :description, presence: true, length: { minimum: 140 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :welcome_message, presence: true

  has_many :reservations
  belongs_to :admin, class_name: "User", foreign_key: "admin_id"
  belongs_to :city

  def overlapping_reservation?(start_date, end_date)
    reservations.any? do |res|
      (start_date...end_date).overlaps?(res.start_date...res.end_date)
    end
  end

  
end
