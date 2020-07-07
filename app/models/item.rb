class Item < ApplicationRecord
  belongs_to :seller, class_name: "User"
  has_one :buyer, class_name: "User"
  has_many :item_images, dependent: :destroy
  belongs_to :category
  # belongs_to_active_hash :item_condition 
  # belongs_to_active_hash :postage_payer
  # belongs_to_active_hash :preparation_day
  # belongs_to_active_hash :postage_type
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture_code

  validates :name,presence: true
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
  enum item_condition: { BrandNew:0,NearUnused:1,NoNoticeableScratchesOrStains:2,
                         SomeScratchesAndDirt:3,ThereAreScratchesAndDirt:4,OverallConditionIsbad:5
  }
 
  enum postage_payer: { PostageIncluded:0,FreightCollect:1}
  enum preparation_day:{ MaxTwo:0,MaxThree:1,MaxSeven:2}
  enum postage_type:{Undecided:0,Courier:1,Post:2}
end
