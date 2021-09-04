class Profile < ApplicationRecord
  belongs_to :user
  # has_many :categories
  # has_many :list_deadlines

  with_options presence: true do
    validates :nickname, length: {
       maximum: 20, message:"is invalid. Please enter at least 20 characters"
      }
    validates :birth_date
  end

  validates :nickname, uniqueness: { message: "That nickname is already in use" }

  validates :precious_word, length: {
     maximum: 100, message:"is invalid. Please enter at least 100 characters"
    }
end
