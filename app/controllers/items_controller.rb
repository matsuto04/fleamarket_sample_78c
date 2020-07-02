class ItemsController < ApplicationController
  def index
  end

  def buy
    Payjp.api_key = "sk_test_15e772991a03b9ebde1f7980"
    Payjp::Change.create(
      amount: 809, #決済する値段
      card: params['payjpToken'], #フォームを送信すると作成,送信してくるトークン
      currency: 'jpy' #通貨
    )
  end
end
