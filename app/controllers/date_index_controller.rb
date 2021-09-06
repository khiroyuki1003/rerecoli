class DateIndexController < ApplicationController
  before_action :authenticate_user!
  before_action :get_user

  def unfinished
    @deadlines = ListDeadline.where(profile_id: @user.profile.id, status: "unfinished").order(:list_deadline_date).order(list_deadline_time: "ASC")
    @reminds = ListRemind.where(profile_id: @user.profile.id, status: "unfinished").order(:list_remind_date).order(list_remind_time: "ASC")
        # binding.pry
  end

  def done
    @deadlines = ListDeadline.where(profile_id: @user.profile.id, status: "done").order(:list_deadline_date).order(list_deadline_time: "DESC")
    @reminds = ListRemind.where(profile_id: @user.profile.id, status: "done").order(:list_remind_date).order(list_remind_time: "DESC")

  end

  private
  def get_user
    if user_signed_in?
      @user = User.find(current_user.id)
    end
  end
end
