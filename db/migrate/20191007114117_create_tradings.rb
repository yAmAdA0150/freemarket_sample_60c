class CreateTradings < ActiveRecord::Migration[5.2]
  def change
    create_table :tradings do |t|
      t.integer :condition, null: false
      t.integer :delivery_to, null: false
      t.integer :payment, null: false
      t.integer :status, null: false
      t.references :item, null: false, index: true, foreign_key: true
      t.references :trader, null: false, index: true, foreign_key: true
      t.references :shipping, null: false, index: true, foreign_key: true
      t.timestamps
    end
  end
end
