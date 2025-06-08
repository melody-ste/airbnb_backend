class RenameUserIdToGuestIdInReservations < ActiveRecord::Migration[8.0]
  def change
    remove_reference :reservations, :user, foreign_key: true
    add_reference :reservations, :guest, null: false, foreign_key: { to_table: :users }
  end
end
