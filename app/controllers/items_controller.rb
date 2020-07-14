class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    @item.item_images.build
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