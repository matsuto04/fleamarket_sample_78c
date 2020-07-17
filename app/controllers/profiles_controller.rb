class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
    @user = User.find(current_user.id)
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to user_path(current_user.id), notice: 'プロフィールを設定しました'
    else
      render :new
    end
  end

  def edit
    @user = User.find(current_user.id)
    @profile = Profile.find(params[:id])
  end

  def update
    @user = User.find(current_user.id)
    @profile = Profile.where(user_id: current_user.id)
    if @profile.update(profile_params)
      redirect_to user_path(current_user.id), notice: 'プロフィールを更新しました'
    else
      render :edit
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:introduce, :avatar).merge(user_id: current_user.id)
  end
end
