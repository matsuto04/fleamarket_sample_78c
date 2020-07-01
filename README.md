# README

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null:false|
|password|string|null:false|
|email|string|null:false, unique:true, index:true|
|first_name|string|null:false|
|family_name|string|null:false|
|first_name_kana|string|null:false|
|family_name_kana|string|null:false|
|birth_year|date|null:false|
|birth_month|date|null:false|
|birth_day|date|null:false|


### Association
- has_many :seller_items, foreign_key: "seller_id", class_name: "items"
- has_many :buyer_items, foreign_key: "buyer_id", class_name: "items"
- has_one :profile, dependent: :destroy
- has_one :sending_destination, dependent: :destroy
- has_one :credit_card, dependent: :destroy

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|introduction|text|null: false|
|price|integer|null: false|
|item_condition|references|null: false, foreign_key: true|
|postage_payer|integer|null: false|
|prefecture_code|integer|null: false|
|preparation_day|integer|null: false|
|postage_type|integer|null: false|
|category|references|null: false, foreign_key: true|
|trading_status|enum|null: false|
|seller|references|null: false, foreign_key: true|
|buyer|references|foreign_key: true|
|deal_closed_date|timestamp| |


### Association
- has_many :item_images, dependent: :destroy
- belongs_to :category
- belongs_to_active_hash :item_condition
- belongs_to_active_hash :postage_payer
- belongs_to_active_hash :preparation_day
- belongs_to_active_hash :postage_type
- belongs_to :seller, class_name: "User"
- belongs_to :buyer, class_name: "User"

## credit_cardsテーブル

|Column|Type|Options|
|------|----|-------|
|card_number|integer|null: false, unique: true|
|expiration_year|integer|null: false|
|expiration_month|integer|null: false|
|security_code|integer|null: false|
|user|references|null:false, foregin_key:ture|

### Association
- belongs_to :user

## profilesテーブル

|Column|Type|Options|
|------|----|-------|
|introduction|text| |
|avatar|string| |
|user|references|null:false, foregin_key:ture|

### Association
- belongs_to :user

## sending_destinationsテーブル

|Column|Type|Options|
|------|----|-------|
|destination_first_name|string|null: false|
|destination_family_name|string|null: false|
|destination_first_name_kana|string|null: false|
|destination_family_name_kana|string|null: false|
|post_code|integer(7)|null: false|
|prefecture_code|integer|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string| |
|phone_number|string|unique: true|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :user

## categoriseテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|null:false|

### Association
- has_many :items

## item_imagesテーブル

|Column|Type|Options|
|------|----|-------|
|url|string|null: false|
|item|references|null: false, foreign_key: true|

### Association
- belongs_to :item