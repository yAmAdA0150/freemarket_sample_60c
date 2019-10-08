class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :postcode, null: false
      t.string :city, null: false
      t.text :street
      t.text :building_name
      t.integer :phone_number
      t.integer :user_id, null: false
      t.timestamps
      t.integer :prefecture_id, null: false
      t.references :user, foreign_key: true
    end
  end
end
