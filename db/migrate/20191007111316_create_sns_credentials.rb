class CreateSnsCredentials < ActiveRecord::Migration[5.2]
  def change
    create_table :sns_credentials do |t|
      t.string :uid, sull: false, unique: true
      t.string :provider,null: false
      t.text :token
      t.timestamps

      t.references :user, null: false, foreign_key: true
    end
  end
end
