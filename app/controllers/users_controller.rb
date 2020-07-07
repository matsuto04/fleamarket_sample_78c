class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(current_user.id)
  end

  def edit
  end

  def destory
    @user.destory
    redirect_to root_path
  end
end
