class ApplicationController < ActionController::Base
  before_action :set_remind

  private

  def set_remind
    if user_signed_in?
      user = User.find(current_user.id)

      if user.profile.present?
        deadlines = ListDeadline.where(profile_id: user.profile.id, status: "unfinished")
        reminds = ListRemind.where(profile_id: user.profile.id, status: "unfinished")

        if deadlines.present?
          deadlines.each do |deadline|

            if ( Date.today > deadline.list_deadline_date ) || ( Date.today == deadline.list_deadline_date && Time.current >= deadline.list_deadline_time )
              create_remind_deadline!(current_user, deadline)
            end
          end
        end

        if reminds.present?
          reminds.each do |remind|

            if ( Date.today > remind.list_remind_date ) || ( Date.today == remind.list_remind_date && Time.current >= remind.list_remind_time )
              create_remind_remind!(current_user, remind)
            end
          end
        end
      end
    end
  end


  def create_remind_deadline!(current_user, list_deadline)
    temp = Remind.where(["profile_id = ? and list_deadline_id = ? and action = ? ", current_user.profile.id, list_deadline.id, 'deadline'])
 
    if temp.blank?
      remind = Remind.new(
        list_deadline_id: list_deadline.id,
        profile_id: current_user.profile.id,
        action: 'deadline'
      )
      remind.save if remind.valid?
    end
  end

  def create_remind_remind!(current_user, list_remind)
    temp = Remind.where(["profile_id = ? and list_remind_id = ? and action = ? ", current_user.profile.id, list_remind.id, 'remind'])
 
    if temp.blank?
      remind = Remind.new(
        list_remind_id: list_remind.id,
        profile_id: current_user.profile.id,
        action: 'remind'
      )
      remind.save if remind.valid?
    end
  end
end
