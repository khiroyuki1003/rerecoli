class List < ApplicationRecord
  belongs_to :category
  has_one :list_deadline, dependent: :destroy
  has_many :list_reminds, dependent: :destroy
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :priority
  
end