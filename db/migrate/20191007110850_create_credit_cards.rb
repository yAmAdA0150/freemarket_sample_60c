class CreateCreditCards < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_cards do |t|
      t.integer :card_number, null:false
      t.integer :month, null: false
      t.integer :year, null: false
      t.integer :security_code, null: false
      t.timestamps

      t.references :user, null: false, foreign_key: true

    end
  end
end
