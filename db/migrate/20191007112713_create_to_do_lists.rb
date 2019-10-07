class CreateToDoLists < ActiveRecord::Migration[5.2]
  def change
    create_table :to_do_lists do |t|
      t.text :text, null: false
      t.timestamps

      t.references :user, null: false, foreign_key: true
    end
  end
end
