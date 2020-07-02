class RemoveBirthMonthFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :birth_month, :date
  end
end
