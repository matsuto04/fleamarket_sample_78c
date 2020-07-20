# fleamarket_sample_78c[![Image from Gyazo](https://i.gyazo.com/afd826f59ce163459cce893fdee84325.jpg)](https://gyazo.com/afd826f59ce163459cce893fdee84325)
## 本番環境　http://54.199.32.127/  
### basic認証　ユーザー: user　パス: pass  
- 【買手】:  
email: buyer@gmail.com  
pass: aaaaaaa1  
テストコード:4242424242424242  
セキュリティコード:283  
- 【売手】:  
email: seller@gmail.com  
pass: 12345678a  

## 【開発メンバー】   
- 坂本莉沙（スクラムマスター）  
- 松山敏也  
- 鳥越幸樹  
- 平井琢也  
## 【このアプリでできること】  
・ユーザー登録を行い商品を出品し、また購入することができます。  
・出品時に画像を複数枚投稿することが出来る。  
・マイページにて自分のプロフィールとアバター画像を設定できる。  
・商品詳細画面で複数枚投稿した画像をスクロールすることが出来る。  

## 【なぜそのアプリを作ったか】
TECH::CAMPの最終課題にてチーム開発のプロセスの体験をするため。  

## 【言語】
Ruby 2.6.5  
Ruby on Rails 6.0.0  
HTML  
CSS  
jQuery  

## 【機能一覧】
■ユーザー機能(devise)  
・新規登録機能  
・ログイン、ログアウト機能  
・プロフィール情報変更機能  

■商品出品機能  
・出品機能  
・画像投稿機能  
・削除機能  
・編集機能  
・カテゴリー機能   

■商品購入機能  
・Pay.jpを使った購入機能  
・クレジットカードの登録機能  
・削除機能  

■検索機能  
・文字検索機能  

■その他の機能  
・ユーザー詳細ページでの、出品商品の一覧表示  
・ユーザー詳細ページでの、投稿数表示機能  
・ユーザー詳細ページでの、プロフィール及びアバターの表示  
・ホーム画面での商品一覧表示  
・売却済商品の差別化  
 
## 【DB設計】
![Untitled Diagram](https://user-images.githubusercontent.com/58378612/87174996-fa09df00-c312-11ea-948b-427cc37c355d.png)

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
|birth_day|date|null:false|


### Association
- has_many :seller_items, foreign_key: "seller_id", class_name: "items"
- has_many :buyer_items, foreign_key: "buyer_id", class_name: "items"
- has_one :profile, dependent: :destroy
- has_one :sending_destination, dependent: :destroy
- accepts_nested_attributes_for :sending_destination
- has_one :card, dependent: :destroy

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|introduction|text|null: false|
|price|integer|null: false|
|item_condition|integer|null: false|
|postage_payer|integer|null: false|
|prefecture_code_id|integer|null: false|
|preparation_day|integer|null: false|
|postage_type|integer|null: false|
|category_id|bigint|null: false, foreign_key: true|
|trading_status|integer|null: false|
|seller|references|null: false, foreign_key: true|
|buyer|references|foreign_key: true|
|deal_closed_date|timestamp|


### Association
- has_many :item_images, dependent: :destroy
- accepts_nested_attributes_for :item_images, allow_destroy: true
- belongs_to :category
- belongs_to :seller, class_name: "User"
- has_one :buyer, class_name: "User"
- belongs_to_active_hash :prefecture_code

## cardsテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null:false, foregin_key:ture|
|customer_id|string|null: false|
|card_id|string|null: false|

### Association
- belongs_to :user

## profilesテーブル

|Column|Type|Options|
|------|----|-------|
|introduce|text| |
|avatar|string| |
|user|references|null:false, foreign_key: true|

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
|prefecture_code_id|integer|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string| |
|phone_number|string|unique: true|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to_active_hash :prefecture_code
- belongs_to :user

## categoriseテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string||

### Association
- has_many :items
- has_ancestry

## item_imagesテーブル

|Column|Type|Options|
|------|----|-------|
|url|string||
|item|references|null: false, foreign_key: true|

### Association
- belongs_to :item, optional: true
