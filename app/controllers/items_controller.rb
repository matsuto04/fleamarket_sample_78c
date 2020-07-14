class ItemsController < ApplicationController
  before_action :set_categorie
  def index
    @parents = Category.where(ancestry: nil)
  end

  def new
    @item = Item.new
    @item.item_images.new
    @category_parent_array = ["選択してください"] #セレクトボックスの初期値設定
    Category.where(ancestry: nil).each do |parent| #データベースから、親カテゴリーのみ抽出し、配列化
      @category_parent_array << parent.name
    end
  end
  # 以下全て、formatはjsonのみ
  def get_category_children # 親カテゴリーが選択された後に動くアクション
    @category_children = Category.find_by(name: "#{params[:parent_name]}").children #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
  end

  def get_category_grandchildren # 子カテゴリーが選択された後に動くアクション
    @category_grandchildren = Category.find("#{params[:child_id]}").children #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
  end

  def create
    @item = Item.new(item_params)
    @category_id = @item.category_id
    if @item.save
      redirect_to root_path
    else
      redirect_to action: :new
    end
  end

  def confirm
    @item = Item.find(params[:id])
    @card = Card.find_by(user_id: current_user.id)
    customer = Payjp::Customer.retrieve(@card.customer_id)
    @default_card_information = customer.cards.retrieve(@card.card_id)
    @user = User.find(current_user.id)
  end

  def show
    @item = Item.find(params[:id])
    @parents = Category.where(ancestry: nil)
    @category_id = @item.category_id
    
    # @category_parent = Category.find(@category_id).parent.parent
    # @category_child = Category.find(@category_id).parent
    # @category_grandchild = Category.find(@category_id)
  end

  def pay
    @item = Item.find(params[:id])
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
    Payjp::Charge.create(
      amount: @item.price,
      customer: card.customer_id,
      currency: 'jpy' #通貨
    )
    @item.update( buyer_id: current_user.id )
    redirect_to root_path
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
      :category_id,
      item_images_attributes: [:item_id, :url]
      )
      .merge(
      seller_id: current_user.id
      )
  end

  def category_params
    { category_id: params[:category_id]}
  end
      
  def set_categories
    @parent_categories = Category.roots
    @child_categories = @parent_categories.first.children
    @grandChild_categories = @child_categories.first.children
  end


  def set_categorie
    @parents = Category.where(ancestry: nil)
  end
end