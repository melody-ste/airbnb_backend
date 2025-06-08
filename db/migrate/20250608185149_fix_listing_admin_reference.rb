class FixListingAdminReference < ActiveRecord::Migration[8.0]
  def change
    remove_reference :listings, :user, foreign_key: true
    add_reference :listings, :admin, null: false, foreign_key: { to_table: :users }
  end
end
