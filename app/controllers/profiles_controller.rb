class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:new, :create, :show, :edit, :update]
  before_action :user_profile_check, only: [:new, :create]

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_profile_check
    if @user.profile.present?
      redirect_to root_path
    end
  end

  def profile_params
    params.require(:profile).permit(:nickname, :precious_word, :birth_date).merge(user: current_user)
  end
end
 