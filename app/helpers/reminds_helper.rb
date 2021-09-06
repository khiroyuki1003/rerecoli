module RemindsHelper
  def unchecked_reminds
    @reminds = Remind.where(profile_id: @user.profile.id, checked: "false")
  end
end
