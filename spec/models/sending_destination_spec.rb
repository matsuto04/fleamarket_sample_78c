require 'rails_helper'


describe SendingDestination do
  describe '#create' do
    it "送付先氏名の苗字が空白だとエラー" do
      send = build(:sending_destination,destination_first_name: "")
      send.valid?
      expect(send.errors[:destination_first_name]).to include("を入力してください")
    end
    it "送付先氏名の名前が空白だとエラー" do
      send = build(:sending_destination,destination_family_name: "")
      send.valid?
      expect(send.errors[:destination_family_name]).to include("を入力してください")
    end
    it "送付先氏名の苗字のふりがなが空白だとエラー" do
      send = build(:sending_destination,destination_first_name_kana: "")
      send.valid?
      expect(send.errors[:destination_first_name_kana]).to include("を入力してください")
    end
    it "送付先氏名の名前のふりがなが空白だとエラー" do
      send = build(:sending_destination,destination_family_name_kana: "")
      send.valid?
      expect(send.errors[:destination_family_name_kana]).to include("を入力してください")
    end
    it "郵便番号が空白だとエラー" do
      send = build(:sending_destination,post_code: "")
      send.valid?
      expect(send.errors[:post_code]).to include("を入力してください")
    end
    it "都道府県コードが空白ならエラー" do
      send = build(:sending_destination,prefecture_code: "")
      send.valid?
      expect(send.errors[:prefecture_code]).to include("を入力してください")
    end
    it "市町村が空白ならエラー" do
      send = build(:sending_destination,city: "")
      send.valid?
      expect(send.errors[:city]).to include("を入力してください")
    end
    it "番地が空白ならエラー" do
      send = build(:sending_destination,house_number: "")
      send.valid?
      expect(send.errors[:house_number]).to include("を入力してください")
    end
    it "重複する電話番号は登録出来ない" do
      send = create(:sending_destination)
      another_send = build(:sending_destination,phone_number: send.phone_number)
      another_send.valid?
      expect(another_send.errors[:phone_number]).to include("はすでに存在します")
    end
    it "郵便番号は7桁の数字でないと登録出来ない。" do
      send = build(:sending_destination,post_code: "000000")
      send.valid?
      expect(send.errors[:post_code]).to include("は不正な値です")
    end
    it "すべての条件が合格すると登録可能" do
      send = build(:sending_destination)
      expect(send).to be_valid
    end
  end
end