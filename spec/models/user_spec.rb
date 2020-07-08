require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

describe User do
  describe '#create' do
    it "すべての条件が合っていれば登録" do
      user = build(:user)
      expect(user).to be_valid
    end
    it "ニックネームが空白だとエラー" do
      user = build(:user,nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end
    
    it "アドレスが空白だとエラー" do
      user = build(:user,email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end
    it "パスワードが空白だとエラー" do
      user = build(:user,password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end
    it "パスワードが存在していてもpassword_confirmationが空白だとエラー" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end
    it "passwordが６文字以下であればエラー" do
      user = build(:user,password: "000000",password_confirmation:"000000")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください")
    end
    it "passwordが７文字以上であれば登録できる" do
      user = build(:user,password: "0000000",password_confirmation: "0000000")
      expect(user).to be_valid
    end
    it "first_nameが空白だと登録出来ない" do
      user = build(:user,first_name: "")
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end
    it "family_nameが空白だと登録出来ない" do
      user = build(:user,family_name: "")
      user.valid?
      expect(user.errors[:family_name]).to include("を入力してください")
    end
    it "first_name_kanaが空白だと登録出来ない" do
      user = build(:user,first_name_kana: "")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("を入力してください")
    end
    it "family_name_kanaが空白だと登録出来ない" do
      user = build(:user,family_name_kana: "")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("を入力してください")
    end
    it "first_nameが全角以外だと登録出来ない" do
      user = build(:user,first_name: "aaa")
      user.valid?
      expect(user.errors[:first_name]).to include("は不正な値です")
    end
    it "family_nameが全角以外だと登録出来ない" do
      user = build(:user,family_name: "aaa")
      user.valid?
      expect(user.errors[:family_name]).to include("は不正な値です")
    end
    it "first_name_kanaが全角カナ以外だと登録出来ない" do
      user = build(:user,first_name_kana: "あああ")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("は不正な値です")
    end
    it "family_name_kanaが全角カナ以外だと登録出来ない" do
      user = build(:user,family_name_kana: "いいい")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("は不正な値です")
    end
    it "birth_dayが空白だと登録出来ない" do
      user = build(:user,birth_day: "")
      user.valid?
      expect(user.errors[:birth_day]).to include("を入力してください")
    end
    it "重複するアドレスは登録出来ない" do
      user = create(:user)
      another_user = build(:user,email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end
  end
end