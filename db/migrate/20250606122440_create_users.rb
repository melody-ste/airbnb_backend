class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :phone_number
      t.text :description

      t.timestamps
    end
  end
end
