require 'rails_helper'

RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe Item do
    describe '#create' do
      it "nameが空白だとエラー" do
        item = build(:item, name: "")
        item.valid?
        expect(item.errors[:name]).to include("can't be blank")
      end

      it "introductionが空白だとエラー" do
        item = build(:item,introduction: "")
        item.valid?
        expect(item.errors[:introduction]).to include("can't be blank")
      end

      it "priceが空白だとエラー" do
        item = build(:item,price: "")
        item.valid?
        expect(item.errors[:price]).to include("can't be blank")
      end

      it "item_conditionが空白だとエラー" do
        item = build(:item,item_condition: "")
        item.valid?
        expect(item.errors[:item_condition]).to include("can't be blank")
      end

      it "postage_payerが空白だとエラー" do
        item = build(:item,postage_payer: "")
        item.valid?
        expect(item.errors[:postage_payer]).to include("can't be blank")
      end

      it "prefecture_code_idが空白だとエラー" do
        item = build(:item,prefecture_code_id: "")
        item.valid?
        expect(item.errors[:prefecture_code]).to include("can't be blank")
      end

      it "preparation_dayが空白だとエラー" do
        item = build(:item,preparation_day: "")
        item.valid?
        expect(item.errors[:preparation_day]).to include("can't be blank")
      end

      it "category_idが空白だとエラー" do
        item = build(:item,category_id: "")
        item.valid?
        expect(item.errors[:category]).to include("must exist")
      end

      it "trading_statusが空白だとエラー" do
        item = build(:item,trading_status: "")
        item.valid?
        expect(item.errors[:trading_status]).to include("can't be blank")
      end

      it "seller_idが空白だとエラー" do
        item = build(:item,seller_id: "")
        item.valid?
        expect(item.errors[:seller]).to include("must exist")
      end

      it "全ての条件が合格だったら登録" do
        item = build(:item)
        binding.pry
        expect(item).to be_valid
      end
    end
  end 
end

