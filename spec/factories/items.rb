FactoryBot.define do
  factory :item do
    name {"ガム"}
    introduction {"ああああああああああああ"}
    price {200}
    item_condition {"NearUnused"}
    postage_payer {"FreightCollect"}
    prefecture_code_id {1}
    preparation_day {"MaxThree"}
    postage_type {"Courier"}
    trading_status {"InTransit"}
    category_id {1}
    seller_id {1}
  end
end
