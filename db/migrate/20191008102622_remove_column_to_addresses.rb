class RemoveColumnToAddresses < ActiveRecord::Migration[5.2]
  def change
    remove_column :addresses, :birthyear, :integer
    remove_column :addresses, :birthmonth, :integer
    remove_column :addresses, :birthday, :integer
  end
end
