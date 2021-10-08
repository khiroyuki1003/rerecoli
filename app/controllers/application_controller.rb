class ApplicationController < ActionController::Base
  before_action :set_remind

  private

  # 未達成かつ目標日時を過ぎたリスト・プロセスがある時、リマインドを作成するメソッドを呼び出す
  def set_remind
    if user_signed_in?
      user = User.find(current_user.id)

      if user.profile.present?
        # 未達成のレコードを抽出
        deadlines = ListDeadline.where(profile_id: user.profile.id, status: "unfinished")
        reminds = ListRemind.where(profile_id: user.profile.id, status: "unfinished")
        # //未達成のレコードを抽出

        if deadlines.present?
          deadlines.each do |deadline|
            # 目標日時が現在日時と同じか、目標日時が現在日時より以前の場合に、リマインド作成のメソッドを呼び出す。
            if ( Date.today > deadline.list_deadline_date ) || ( Date.today == deadline.list_deadline_date && Time.current >= deadline.list_deadline_time )
              create_remind_deadline!(current_user, deadline)
            end
            # //目標日時が現在日時と同じか、目標日時が現在日時より以前の場合に、リマインド作成のメソッドを呼び出す。
          end
        end

        if reminds.present?
          reminds.each do |remind|
            # 目標日時が現在日時と同じか、目標日時が現在日時より以前の場合に、リマインド作成のメソッドを呼び出す。
            if ( Date.today > remind.list_remind_date ) || ( Date.today == remind.list_remind_date && Time.current >= remind.list_remind_time )
              create_remind_remind!(current_user, remind)
            end
            # //目標日時が現在日時と同じか、目標日時が現在日時より以前の場合に、リマインド作成のメソッドを呼び出す。
          end
        end
      end
    end
  end
  # //未達成かつ目標日時を過ぎたリスト・プロセスがある時、リマインドを作成するメソッドを呼び出す


  # リストのリマインドを作成する
  def create_remind_deadline!(current_user, list_deadline)
    # 同じリマインドを既に作成していないか確認する。
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
  # //リストのリマインドを作成する

  # プロセスのリマインドを作成する
  def create_remind_remind!(current_user, list_remind)
    # 同じリマインドを既に作成していないか確認する。
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
  # //プロセスのリマインドを作成する

end
