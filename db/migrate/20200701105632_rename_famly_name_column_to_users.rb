class RenameFamlyNameColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :famly_name, :family_name
  end
end
