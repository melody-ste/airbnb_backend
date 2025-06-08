class CreateReservations < ActiveRecord::Migration[8.0]
  def change
    create_table :reservations do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.references :guest, null: false, foreign_key: { to_table: :users }
      t.references :listing, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
