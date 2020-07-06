class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User"
  has_many :item_images, dependent: :destroy
  belongs_to :category
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :preparation_day
  belongs_to_active_hash :postage_type
  belongs_to_active_hash :prefecture_code

  validatas :name,presence: true
  validates :introduction,presence: true
  validates :price,presence: true
  validates :item_condition,presence: true
  validates :postage_payer,presence: true
  validates :prefecture_code,presence: true
  validates :preparation_day,presence: true
  validates :postage_type,presence: true
  validates :category_id,presence: true
  validates :trading_status,presence: true
  validates :seller_id,presence: true

  enum trading_status: { AlreadyDelivered:0,
                          InTransit:1,
                          InDelivery:2,
                          Delivered:3,
                          InVestigating:4
                        }
 
end
