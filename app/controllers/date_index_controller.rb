class DateIndexController < ApplicationController
  before_action :authenticate_user!
  before_action :get_user

  def unfinished
    @deadlines = ListDeadline.where(profile_id: @user.profile.id, status: "unfinished")
    @reminds = ListRemind.where(profile_id: @user.profile.id, status: "unfinished")
        # binding.pry
  end

  def done
    @deadlines = ListDeadline.where(profile_id: @user.profile.id, status: "done")
    @reminds = ListRemind.where(profile_id: @user.profile.id, status: "done")

  end

  private
  def get_user
    if user_signed_in?
      @user = User.find(current_user.id)
    end
  end
end
