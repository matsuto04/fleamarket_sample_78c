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

  enum trading_status: { AlreadyDelivered:0,#配送済み
                          InTransit:1,#輸送中
                          InDelivery:2,#配達中
                          Delivered:3,#配達済み
                          InVestigating:4#調査中
                        }
  enum item_condition: { BrandNew:0,#新品、未使用
                        NearUnused:1,#未使用に近い
                        NoNoticeableScratchesOrStains:2,#目立った傷や汚れなし
                         SomeScratchesAndDirt:3,#やや傷や汚れあり
                         ThereAreScratchesAndDirt:4,#傷や汚れあり
                         OverallConditionIsbad:5#全体的に状態が悪い
                        }
 
  enum postage_payer: { PostageIncluded:0,#送料込み
                        FreightCollect:1#着払い
                      }
  enum preparation_day:{ MaxTwo:0,#1~2日で発送
                        MaxThree:1,#2~3日で発送
                        MaxSeven:2#4~7日で発送
                      }
  enum postage_type:{Undecided:0,#未定
                      Courier:1,#宅急便
                      Post:2#郵便
                    }
end
