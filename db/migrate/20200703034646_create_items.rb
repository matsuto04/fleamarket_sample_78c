class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,null: false
      t.text :introduction,null: false
      t.integer :price,null: false
      t.integer :item_condition,null: false
      t.integer :postage_payer,null: false
      t.integer :prefecture_code,null: false
      t.integer :preparation_day,null: false
      t.integer :postage_type,null: false
      t.bigint :category_id,null: false,type: :integer
      t.integer :trading_status,default: 0,null: false
      t.references :buyer,foreign_key: { to_table: :users},optional: true
      t.references :seller,null: false,foreign_key: {to_table: :users}
      t.timestamp :deal_closed_date
      t.timestamps
    end
    add_foreign_key :items, :categories
    
  end
end
