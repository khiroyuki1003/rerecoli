class RemindsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_user
  before_action :set_reminds, only: [:index, :all_checked]

  def index
  end

  def checked
    remind = Remind.find(params[:id])
    if remind.update(checked: true)
      redirect_to profile_reminds_path(@user.profile.id)
    else
      render :index
    end
  end

  def all_checked
    if @reminds.update_all(checked: true)
      redirect_to profile_reminds_path(@user.profile.id)
    else
      render :index
    end
  end

  private
  def get_user
    if user_signed_in?
      @user = User.find(current_user.id)
    end
  end

  def set_reminds
    @reminds = Remind.where(profile_id: @user.profile.id, checked: "false")
  end
end
