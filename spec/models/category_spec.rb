require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe Category do
    describe '#create' do
      it "すべての条件が合っていれば登録" do
        category = build(:category)
        expect(category).to be_valid
      end
      it "名前が空白ならばエラー" do
        category = build(:category,name: "")
        category.valid?
        expect(category.errors[:name]).to include("can't be blank")
      end
    end
  end
end

