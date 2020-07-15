class ItemImage < ApplicationRecord
  valideates :url, presence: true
  belongs_to :item, optional: true
  mount_uploader :url, ImageUploader
end
