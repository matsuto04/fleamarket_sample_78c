class ItemsController < ApplicationController
  before_action :set_categories, only: [:new, :create]
  
  def index
  end

  def new
    @item = Item.new
    @item.item_images.build
  end

  def create
    @item = Item.new(item_params)
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
end

  private
  def item_params
    params.require(:item).permit(:name, item_images_attributes:[:id, :url])
  end

  def set_categories
    @parent_categories = Category.roots
    @child_categories = @parent_categories.first.children
    @grandChild_categories = @child_categories.first.children
  end