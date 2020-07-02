require 'rails_helper'

# RSpec.describe User, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

describe User do
  describe '#create' do
    it "すべての条件が合っていれば登録" do
      user = build(:user)
      expect(user).to be_valid
    end
    it "ニックネームが空白だとエラー" do
      user = build(:user,nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end
    
    it "アドレスが空白だとエラー" do
      user = build(:user,email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end
    it "パスワードが空白だとエラー" do
      user = build(:user,password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end
    it "パスワードが存在していてもpassword_confirmationが空白だとエラー" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end
    it "passwordが６文字以下であればエラー" do
      user = build(:user,password: "000000",password_confirmation:"000000")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 7 characters)")
    end
    it "passwordが７文字以上であれば登録できる" do
      user = build(:user,password: "0000000",password_confirmation: "0000000")
      expect(user).to be_valid
    end
    it "first_nameが空白だと登録出来ない" do
      user = build(:user,first_name: "")
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end
    it "family_nameが空白だと登録出来ない" do
      user = build(:user,family_name: "")
      user.valid?
      expect(user.errors[:family_name]).to include("can't be blank")
    end
    it "first_name_kanaが空白だと登録出来ない" do
      user = build(:user,first_name_kana: "")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("can't be blank")
    end
    it "family_name_kanaが空白だと登録出来ない" do
      user = build(:user,family_name_kana: "")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("can't be blank")
    end
    it "first_nameが全角以外だと登録出来ない" do
      user = build(:user,first_name: "aaa")
      user.valid?
      expect(user.errors[:first_name]).to include("is invalid")
    end
    it "family_nameが全角以外だと登録出来ない" do
      user = build(:user,family_name: "aaa")
      user.valid?
      expect(user.errors[:family_name]).to include("is invalid")
    end
    it "first_name_kanaが全角カナ以外だと登録出来ない" do
      user = build(:user,first_name_kana: "あああ")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("is invalid")
    end
    it "family_name_kanaが全角カナ以外だと登録出来ない" do
      user = build(:user,family_name_kana: "いいい")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("is invalid")
    end
    it "birth_dayが空白だと登録出来ない" do
      user = build(:user,birth_day: "")
      user.valid?
      expect(user.errors[:birth_day]).to include("can't be blank")
    end
    it "重複するアドレスは登録出来ない" do
      user = create(:user)
      another_user = build(:user,email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end
  end
end