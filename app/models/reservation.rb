class Reservation < ApplicationRecord
  
  validate :no_overlapping_reservations
  validates :end_date, comparison: { greater_than: :start_date }
  

  belongs_to :listing
  belongs_to :guest, class_name:"User"

  def no_overlapping_reservations
    return unless listing && start_date && end_date

    if listing.overlapping_reservation?(start_date, end_date)
      errors.add(:base, "This listing is not available for the selected dates")
    end
  end

  def duration
    (end_date - start_date).to_i
  end

end