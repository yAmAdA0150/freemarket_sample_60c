class CreateShippings < ActiveRecord::Migration[5.2]
  def change
    create_table :shippings do |t|
      t.string :charge, hull: false
      t.string :delivery_method, null: false
      t.integer :days_to_be_delivered, null: false
      t.string :delivery_to, null: false, foreign_key: true
      t.timestamps
    end
  end
end
