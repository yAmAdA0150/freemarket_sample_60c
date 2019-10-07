class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :review, null: false
      t.text :text, null: false
      t.timestamps

      t.references :trader, null: false, foreign_key: true
    end
  end
end
