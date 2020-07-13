class ItemsController < ApplicationController
before_action :set_user

  def index
    @parents = Category.where(ancestry: nil)
  end

  def new
  end

  def confirm
  end

  def show
    @item = Item.find(params[:id])
    @parents = Category.where(ancestry: nil)
    @category_id = @item.category_id
    # @category_parent = Category.find(@category_id).parent.parent
    # @category_child = Category.find(@category_id).parent
    # @category_grandchild = Category.find(@category_id)
  end

  def buy
    Payjp.api_key = "sk_test_15e772991a03b9ebde1f7980"
    Payjp::Change.create(
      amount: 809, #決済する値段
      card: params['payjp-token'], #フォームを送信すると作成,送信してくるトークン
      currency: 'jpy' #通貨
    )
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
