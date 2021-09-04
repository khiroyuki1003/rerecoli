class  ListListDeadline 
  include ActiveModel::Model
  include ActiveRecord::AttributeAssignment
  attr_accessor :list_title, :list_detail, :priority_id, :category_id, :list_deadline_date, :list_deadline_time, :list_id, :category, :profile

  validates :list_title, presence: true, length: {
    maximum: 100, message:"is invalid. Please enter at least 100 characters"
   }

   with_options presence: true do
    validates :list_deadline_date
    validates :list_deadline_time
  end

  def save
    list = List.create(
      list_title: list_title, list_detail: list_detail,
      priority_id: priority_id, category_id: category_id
    )
    ListDeadline.create(
      list_deadline_date: list_deadline_date,
      list_deadline_time: list_deadline_time,
      list_id: list.id, profile_id: profile.id
    )
  end
end 