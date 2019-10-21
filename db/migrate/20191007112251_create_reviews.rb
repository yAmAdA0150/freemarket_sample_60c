class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :review, null: false
      t.text :text, null: false
      t.timestamps
      t.integer :trading_id, null: false
    end
  end
end
