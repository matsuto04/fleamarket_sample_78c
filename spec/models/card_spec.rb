require 'rails_helper'
describe Card do
  describe '#create' do
    it "入力必須項目が設定されていれば登録できる事" do
      expect(build(:card)).to be_valid
    end
  end
end
