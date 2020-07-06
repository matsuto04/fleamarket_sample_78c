class RemoveBirthYearFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :birth_year, :date
  end
end
