class CardsController < ApplicationController
  require 'payjp'
  before_action :set_card, only:[:index, :show, :destroy]
  before_action :set_category

  def index
    if @card.blank?
      render :new
    else
      Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def new
    @card = Card.where(user_id: current_user.id)
    redirect_to card_path(current_user.id) if @card.exists?
  end

  def create
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
    if params['payjp-token'].blank?
      render :new
    else
      customer = Payjp::Customer.create(
        card: params['payjp-token'],
        metadata: {user_id: current_user.id}
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to user_path(current_user.id)
      else
        render :new
      end
    end
  end

  def show
    if @card.blank?
      redirect_to new_card_path
    else
      Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end


  def destroy
    if @card.blank?
      render :new
    else
      Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
      customer = Payjp::Customer.retrieve(@card.customer_id)
      customer.delete
      @card.delete
      redirect_to user_path(current_user.id)
    end
  end


  private

  def card_params
    params.require(:card).permit(:user_id, :customer_id, :card_id).merge(user_id: current_user.id)
  end

  def set_card
    @card = Card.find_by(user_id: current_user.id)
  end

  def set_category
    @parents = Category.where(ancestry: nil)
  end
end
