class CreateShippings < ActiveRecord::Migration[5.2]
  def change
    create_table :shippings do |t|
      t.integer :charge, null: false
      t.integer :delivery_method_id, null: false
      t.integer :term_id, null: false
      t.integer :prefecture_id, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.timestamps
    end
  end
end
