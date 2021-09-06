class Remind < ApplicationRecord
  default_scope -> { order(created_at: :desc) }

  belongs_to :profile
  belongs_to :list_deadline, optional: true
  belongs_to :list_remind, optional: true
end
 