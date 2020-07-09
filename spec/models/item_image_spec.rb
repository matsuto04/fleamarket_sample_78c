require 'rails_helper'

RSpec.describe ItemImage, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe ItemImage do
    describe "#create" do
      it "全ての条件があっていれば登録" do
        itemimage = build(:item_image)
        expect(itemimage).to be_valid
      end
      it "urlが未記入であれば登録出来ない。" do
        itemimage = build(:item_image,url: "")
        itemimage.valid?
        expect(itemimage.errors[:url]).to include("を入力してください")
      end
      it "item_idが未入力であれば登録出来ない" do
        itemimage = build(:item_image,item_id: "")
        itemimage.valid?
        expect(itemimage.errors[:item]).to include("を入力してください")
      end
    end
  end
end
