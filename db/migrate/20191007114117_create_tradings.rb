class CreateTradings < ActiveRecord::Migration[5.2]
  def change
    create_table :tradings do |t|
      t.integer :status_id, null: false
      t.references :buyer, null: false,index: true, foreign_key: {to_table: :users}
      t.references :seller, null: false,index: true, foreign_key: {to_table: :users}
      t.references :item, null: false, index: true, foreign_key: true
      t.timestamps
    end
  end
end
