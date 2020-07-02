class SendingDestination < ApplicationRecord
  belongs_to :user

  validates :phone_number,presence: true,uniqueness: true
  validates :destination_first_name,presence: true
  validates :destination_family_name,presence: true
  validates :destination_first_name_kana,presence: true
  validates :destination_family_name_kana,presence: true
  validates :post_code,presence: true,format:{ with: }
  validates :prefecture_code,presence: true
  validates :city,presence: true
  validates :house_number,presence: true

end
