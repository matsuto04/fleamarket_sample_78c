class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def confirm
  end

  def buy
    Payjp.api_key = "sk_test_15e772991a03b9ebde1f7980"
    Payjp::Change.create(
      amount: 809, #決済する値段
      card: params['payjp-token'], #フォームを送信すると作成,送信してくるトークン
      currency: 'jpy' #通貨
    )
  end

  def item_params
    params.require(:item).premit(:name, :introduction, :price, :item_condition, :postage_payer, :prefecture_code_id, :preparation_day, :postage_type, :category_id, :trading_status, :buyer_id)
  end
end
