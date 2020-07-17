class ProfilesController < ApplicationController

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      redirect_to root_path, notice: 'プロフィールを更新しました'
    else
      render :edit
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:introduce, :avatar, user_id: [])
  end
end
