FactoryBot.define do
 
  factory :user do
    nickname  {"matsu"}
    email {"kkk@gmail.com"}
    password {"00000000"}
    password_confirmation {"00000000"}
    first_name {"あああ"}
    family_name {"いいい"}
    first_name_kana {"アアア"}
    family_name_kana {"イイイ"}
    birth_year {19960321}
    birth_month {1}
    birth_day {1}
  end
end
