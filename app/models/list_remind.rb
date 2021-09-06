class ListRemind < ApplicationRecord
  belongs_to :profile
  belongs_to :list 
  has_many :reminds, dependent: :destory

  with_options presence: true do
    validates :list_remind_date
    validates :list_remind_time
    validates :list_remind_title, length: {
      maximum: 100, message:"is invalid. Please enter at least 100 characters"
     }
  end
end
 