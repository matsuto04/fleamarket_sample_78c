class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,presence: true
  validates :email,presence: true,uniqueness: true
  validates :encrypted_password,presence: true,length: { minimum: 7 }
  validates :first_name,presence: true,format: {with: /\A[ぁ-んァ-ン一-龥]/}
  validates :family_name,presence: true,format: {with: /\A[ぁ-んァ-ン一-龥]/}
  validates :first_name_kana,presence: true,format: {with: [\p{katakana}　ー－&&[^ -~｡-ﾟ]]+}
  validates :family_name_kana,presence: true,format: {with: [\p{katakana}　ー－&&[^ -~｡-ﾟ]]+}
  validates :birth_year,presence: true
  validates :birth_month,presence: true
  validates :birth_day,presence: true
  
  has_many :seller_items, foreign_key: "seller_id",class_name: "items"
  has_many :buyer_items, foreign_key: "buyer_id",class_name: "items"
  has_one :profile, dependent: :destroy
  has_one :sending_destination, dependent: :destroy
  has_one :credit_card, dependent: :destroy

end
