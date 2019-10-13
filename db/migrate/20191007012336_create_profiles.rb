class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|

      t.integer :sales
      t.integer :point
      t.string :image
      t.text :text
      t.integer :user_id, null: false
      t.timestamps
      
    end
  end
end
