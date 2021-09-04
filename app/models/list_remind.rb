class ListRemind < ApplicationRecord
  belongs_to :profile
  belongs_to :list 
end
