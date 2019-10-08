class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|

      t.integer :mobile_number,null: false, unique: true
      t.integer :sales
      t.integer :point
      t.string :image
      t.text :text
      t.integer :user_id, null: false
      t.timestamps
      
      t.references :user, foreign_key: true
    end
  end
end
