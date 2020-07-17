class Item < ApplicationRecord
  belongs_to :seller, class_name: "User"
  has_one :buyer, class_name: "User"
  has_many :item_images, dependent: :destroy
  accepts_nested_attributes_for :item_images, allow_destroy: true
  belongs_to :category
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

  #配送状況
  enum trading_status: { 
                          '配送済み':0,
                          '輸送中':1,
                          '配達中':2,
                          '配達済み':3,
                          '調査中':4,
                        }
  #商品の状態
  enum item_condition: {
                          '新品、未使用':0,
                          '未使用に近い':1,
                          '目立った傷や汚れなし':2,
                          'やや傷や汚れあり':3,
                          '傷や汚れあり':4,
                          '全体的に状態が悪い':5,
                        }
  #配送料の負担
  enum postage_payer: {
                        '送料込み':0,
                        '着払い':1,
                      }
  #発送までの日数
  enum preparation_day: { 
                        '1~2日で発送':0,
                        '2~3日で発送':1,
                        '4~7日で発送':2,
                      }
  #配送の方法
  enum postage_type: { 
                      '未定':0,
                      '宅急便':1,
                      '郵便':2
                    }

  def self.search(search)
    return Item.all unless search
    Item.where('name LIKE(?)', "%#{search}%")
  end
end
