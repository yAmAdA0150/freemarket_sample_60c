class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.text :text, null: false
      t.timestamps

      t.references :user, null: false, foreign_key: true
    end
  end
end
