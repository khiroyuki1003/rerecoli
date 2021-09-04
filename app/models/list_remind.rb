class ListRemind < ApplicationRecord
  belongs_to :profile
  belongs_to :list 

  with_options presence: true do
    validates :list_deadline_date
    validates :list_deadline_time
  end
end
