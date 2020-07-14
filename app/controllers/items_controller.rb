class ItemsController < ApplicationController


  def index
    @parents = Category.where(ancestry: nil)
  end

  def new
    @item = Item.new
    @item.item_images.new
    @category_parent_array = ["---"] #セレクトボックスの初期値設定
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
    @item.category_id = "1"
    if @item.save
      redirect_to root_path
    else
      redirect_to action: :new
    end
  end

  def confirm
  end

  def show
    @item = Item.find(params[:id])
    @parents = Category.where(ancestry: nil)
    @category_id = @item.category_id
    @item_images = ItemImage.find(params[:id])
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

  def edit
    @item = Item.find(params[:id])
    @category_parent_array = ["---"] #セレクトボックスの初期値設定
    Category.where(ancestry: nil).each do |parent| #データベースから、親カテゴリーのみ抽出し、配列化
      @category_parent_array << parent.name
    end
    @item_images = ItemImage.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to :root_path
    else
      render action: :edit
    end
  end

  private

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
    ).merge(
      seller_id: current_user.id
    )
  end

  def set_categories
    @parent_categories = Category.roots
    @child_categories = @parent_categories.first.children
    @grandChild_categories = @child_categories.first.children
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