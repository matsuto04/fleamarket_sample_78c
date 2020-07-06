class ChangeCreditCardToCard < ActiveRecord::Migration[6.0]
  def change
    rename_table :credit_cards, :cards
  end
end
