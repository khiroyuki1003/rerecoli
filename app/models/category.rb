class Category < ApplicationRecord
  belongs_to :profile
  has_many :lists, dependent: :destroy
  has_many :list_deadlines

  validates :category_name, presence: true, length: {
    maximum: 20, message:"is invalid. Please enter at least 20 characters"
   }
end
   