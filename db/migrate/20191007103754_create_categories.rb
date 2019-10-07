class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :genre, null: false, unique: true
      t.string :ancestry

      t.timestamps
    end
  end
end
