class UsersController < ApplicationController
  before_action :set_user
  before_action :set_category
  def index
  end

  def show
    @user = User.find(current_user.id)
    @parents = Category.where(ancestry: nil)
    @items = Item.where(seller_id: @user)
  end

  def edit
    @user = User.find(params[:id])
    @sending_destination = @user.sending_destination
  end

  def update
    if @user.update(user_params) && @sending_destination
      redirect_to @user
    else
      render :edit
    end
  end

  def destory
    @user.destory
    redirect_to root_path
  end

  private 
  def user_params
    params.require(:user).permit(
    :nickname,
    :first_name,
    :family_name,
    :first_name_kana,
    :family_name_kana,
    :birth_day,
    :destination_first_name,
    :destination_family_name,
    :destination_first_name_kana,
    :destination_family_name_kana,
    :post_code, 
    :prefecture_code,
    :city,
    :house_number,
    :building_name,
    :phone_number
    )
  end

  def set_user
    @user = User.find(params[:id])
  end

  def set_category
    @parents = Category.where(ancestry: nil)
  end

end
