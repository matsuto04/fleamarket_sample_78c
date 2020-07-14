class ItemsController < ApplicationController
  before_action :set_categorie
  def index
  end

  def new
    @item = Item.new
    @item.item_images.new
    @category_parent_array = ["---"] #セレクトボックスの初期値設定
    Category.where(ancestry: nil).each do |parent| #データベースから、親カテゴリーのみ抽出し、配列化
      @category_parent_array << parent.name
    end
  end

  def show
    
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
      category_ids: [],
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

  def set_categorie
    @parents = Category.where(ancestry: nil)
  end
end

