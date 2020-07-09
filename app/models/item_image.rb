class ItemImage < ApplicationRecord
  belongs_to :item

  validates :url,presence: true
  validates :item_id,null: false
end
