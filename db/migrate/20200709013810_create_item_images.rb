class CreateItemImages < ActiveRecord::Migration[6.0]
  def change
    create_table :item_images do |t|
      t.string :url
      t.references :item,null: false
      t.timestamps
    end
    add_foreign_key :item_images, :items
  end
end
