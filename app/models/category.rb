class Category < ApplicationRecord
  has_many :item
  has_ancestry
  
  validates :name,presence: true
end
