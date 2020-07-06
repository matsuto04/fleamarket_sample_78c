require 'rails_helper'

RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe Item do
    describe '#create' do
      it "nameが空白だとエラー" do
        item = build(:item,name: "")
        item.valid?
        expect(item.errors[:name]).to include("can't be blank")
      end
    end
  end
  
end

