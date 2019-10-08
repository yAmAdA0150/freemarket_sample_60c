class RemoveColumnToProfiles < ActiveRecord::Migration[5.2]
  def change

    remove_column :profiles, :first_name_kana, :string
    remove_column :profiles, :last_name_kana, :string
  end
end
