class ItemImage < ApplicationRecord
  belongs_to :item, optional: true
  validates :url, presence: true
  mount_uploader :url, ImageUploader
end
