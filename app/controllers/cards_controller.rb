
#ログインした状態でのviewなので、エラー回避のためにコメントアウトしています

class CardsController < ApplicationController
#   require "payjp"
#   before_action :set_card, only: [:index, :show, :destroy]

#   def index
#     if @card.blank?
#       #登録された情報がない場合にカード登録画面に移動
#       flash[:alert] = 'カードを登録してください'
#       render :new
#     else
#       Payjp.api_key = "sk_test_15e772991a03b9ebde1f7980"
#       costomer = Payjp::Customer.retrieve(@card.customer_id)
#       @default_card_information = customer.cards.retrieve(@card.card_id)
#     end
#   end

#   def new #クレジットカードの登録画面
#     @card = Card.where(user_id: current_user.id)
#     redirect_to card_path(current_user.id) if @card.exists?
#   end

#   def create # クレジットカードの登録
#     Payjp.api_key = "sk_test_15e772991a03b9ebde1f7980" # テスト鍵のセット
#     if params['payjp-token'].blank? # paramsの中にjsで作ったトークンがあるか確かめる
#       render :new
#     else # トークンが発行されていたら、顧客情報をpayjpに保存
#       costomer = Payjp::Customer.create(
#         card: params['payjp-token'], #送られてくるトークンを顧客情報に紐付けて永久保存
#         metadate: {user_id: current_user.id}
#       )
#       @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
#       if @card.save # DBに保存
#         flash[:notice] = "カードの登録が完了しました"
#         redirect_to root_path
#       else
#         falsh[:alert] = "カードの登録に失敗しました"
#         redirect_to :new
#       end
#     end
#   end

#   def show #Cardのデータをpayjpに送り情報を取り出す
#     if @card.blank? #登録された情報がない場合にカード登録画面に移動
#       redirect_to new_card_path
#     else
#       Payjp.api_key = "sk_test_15e772991a03b9ebde1f7980"
#       costomer = Payjp::Customer.retrieve(@card.customer_id) #Payjp::Customer.retrieveは顧客情報を取得するメソッド
#       @default_card_information = customer.cards.retrieve(@card.card_id) #viewで使う
#     end
#   end

#   def destroy #PayjpとCredit_cardデータベースの削除
#     if @card.blank?
#       render :new
#     else
#       Payjp.api_key = "sk_test_15e772991a03b9ebde1f7980"
#       costomer = Payjp::Customer.retrieve(@card.customer_id)
#       costomer.delete #payjpの方を消す
#       @card.delete #テーブルのデータの消去
#     end
#       flash[:notice] = 'カードが削除されました'
#       redirect_to root_path
#   end

#   private
#   def card_params
#     params.require(:card).permit(:user_id, :customer_id, :card_id).merge(user_id: current_user.id)
#   end

#   def set_card
#     @card = Card.find_by(user_id: current_user.id)
#   end

end
