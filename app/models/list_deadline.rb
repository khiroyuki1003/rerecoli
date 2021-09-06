class ListDeadline < ApplicationRecord
  belongs_to :profile
  belongs_to :list 
  has_many :reminds, dependent: :destory

  with_options presence: true do
    validates :list_deadline_date
    validates :list_deadline_time
  end
end
 