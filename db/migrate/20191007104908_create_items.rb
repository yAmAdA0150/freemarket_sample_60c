class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false, index: true
      t.integer :price, null: false
      t.text :text, null: false
      t.integer :condition_id, null: false
      t.integer :display_id, null: false
      t.timestamps
      t.integer :size_id
      t.integer :brand_id, index: true
      t.references :category, null: false, index: true, foreign_key: true
      t.references :user, null: false, index: true, foreign_key: true
    end
  end
end
