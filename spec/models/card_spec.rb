require 'rails_helper'
describe Card do
  describe '#create' do
    it "入力必須項目が設定されていれば登録できる事" do
      expect(build(:card)).to be_valid
    end

    it "user_idが無かったら無効" do
      card = build(:card, user_id: nil)
      card.valid?
      expect(card.errors[:user]).to include("を入力してください")
    end

    it "customer_idが無かったら無効" do
      card = build(:card, customer_id: nil)
      card.valid?
      expect(card.errors[:customer_id]).to include("を入力してください")
    end

    it "card_idが無かったら無効" do
      card = build(:card, card_id: nil)
      card.valid?
      expect(card.errors[:card_id]).to include("を入力してください")
    end
  end
end
