class Reservation < ApplicationRecord
  # validates :end_date, start_must_be_before_end_time
  # validates :no_overlapping_reservations
  validates :end_date, comparison: { greater_than: :start_date }
  

  belongs_to :listing
  belongs_to :guest, class_name:"User"

  # def end_date_after_start_date
  #   return unless start_date && end_date

  #   if end_date <= start_date
  #     errors.add(:end_date, "must be after start date")
  #   end
  # end

  def no_overlapping_reservations
    return unless listing && start_date && end_date

    if listing.overlapping_reservation?(start_date, end_date)
      errors.add(:base, "This listing is not available for the selected dates")
    end
  end

end