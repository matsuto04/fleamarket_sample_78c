FactoryBot.define do
  factory :sending_destination do
    destination_first_name {"matsu"}
    destination_family_name {"toshi"}
    destination_first_name_kana {"まつ"}
    destination_family_name_kana {"とし"}
    post_code {"1111111"}
    prefecture_code {"1"}
    city {"世田谷区"}
    house_number {"11-1"}
    phone_number {"08023451234"}
    user_id {1}
  end
end
