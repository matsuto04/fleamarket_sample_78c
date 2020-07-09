FactoryBot.define do
  factory :item_image do
    url {"aaaaaaaaaaaaaaaa"}
    item_id {FactoryBot.create(:item).id}
  end
end
