class ItemsController < ApplicationController
  before_action :set_categories, only: [:new, :create]
  
  def index
  end

  def new
    @item = Item.new
    @item.item_images.new
  end

  def create
    @item = Item.new(item_params)
    @item.category_id = "1"
    if @item.save
      redirect_to root_path
    else
      redirect_to action: :new
    end
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
    params.require(:item).permit(
      :name,
      :introduction,
      :item_condition,
      :postage_payer,
      :prefecture_code_id,
      :preparation_day,
      :price,
      item_images_attributes: [:item_id, :url]
    ).merge(
      seller_id: current_user.id
    )
  end

  def set_categories
    @parent_categories = Category.roots
    @child_categories = @parent_categories.first.children
    @grandChild_categories = @child_categories.first.children
  end