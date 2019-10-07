class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :postcode, null: false
      # t.references :prefecture, null: false, foreign_key: true
      t.string :city, null: false
      t.text :street
      t.text :building_name
      t.integer :phone_number
      t.integer :birthyear
      t.integer :birthmonth
      t.integer :birthday
      t.integer :user_id, null: false
      t.timestamps

      t.references :user, foreign_key: true
    end
  end
end
