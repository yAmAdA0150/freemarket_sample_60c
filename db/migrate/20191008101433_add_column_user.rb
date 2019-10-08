class AddColumnUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :first_name_kana, :string
    add_column :users, :last_name_kana, :string
    add_column :users, :birthyear, :integer
    add_column :users, :birthmonth, :integer
    add_column :users, :birthday, :integer
  end
end
