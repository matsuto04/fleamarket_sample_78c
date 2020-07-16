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
    if @item.item_image_ids.nil?
      redirect_to action: :new
    end
    if @item.save
      redirect_to root_path
    else
      redirect_to action: :new
    end
  end

  def confirm
    @item = Item.find(params[:id])
    @card = Card.find_by(user_id: current_user.id)
    if @card.blank?
      redirect_to new_card_path
    else
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
      @user = User.find(current_user.id)
    end
  end

  def show
    @item = Item.find(params[:id])
    @grandChild_category = Category.find(@item.category_id)
    @child_category = @grandChild_category.parent
    @parent_category = @child_category.parent
  end

  def pay
    @item = Item.find(params[:id])
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to new_card_path
    else
      Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
      Payjp::Charge.create(
        amount: @item.price,
        customer: card.customer_id,
        currency: 'jpy' #通貨
      )
      @item.update( buyer_id: current_user.id )
      redirect_to root_path
    end
  end


  def edit
    @item = Item.find(params[:id])
    @category_parent_array = ["---"] #セレクトボックスの初期値設定
    Category.where(ancestry: nil).each do |parent| #データベースから、親カテゴリーのみ抽出し、配列化
      @category_parent_array << parent.name
    end
    @category_list = Category.all.where(ancestry: nil).map{|i| [i.name, i.id]}
    
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to :root_path
    else
      render action: :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
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
      item_images_attributes: [:item_id, :url, :_destroy]
      )
      .merge(
      seller_id: current_user.id
      )
  end

  def item_update_params
    params.require(:item).permit(
      :name,
      :introduction,
      :item_condition,
      :postage_payer,
      :prefecture_code_id,
      :preparation_day,
      :price,
      :category_id,
      :image_cache,
      item_images_attributes: [:item_id, :url]
    ).merge(
      seller_id: current_user.id
    )
  end

  def set_categorie
    @parents = Category.where(ancestry: nil)
  end
end

