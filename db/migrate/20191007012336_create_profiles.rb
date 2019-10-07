class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|

      t.integer :mobile_number,null: false, unique: true
      t.string :last_name,null: false
      t.string :first_name,null: false
      t.string :last_name_kana, null: false
      t.string :first_name_kana, null: false
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
