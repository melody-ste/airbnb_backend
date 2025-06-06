class CreateListings < ActiveRecord::Migration[8.0]
  def change
    create_table :listings do |t|
      t.integer :available_beds, null: false
      t.integer :price, null: false
      t.text :description
      t.boolean :has_wifi
      t.text :welcome_message
      t.references :city, null: false, foreign_key: true
  
      t.references :admin, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end

    add_index :listings, :price
    add_index :listings, :available_beds

  end

end
