require 'rails_helper'

RSpec.describe Category, type: :model do
  before do
    @category = FactoryBot.build(:category)
  end

  context 'カテゴリ作成できる時' do
    it 'カテゴリ名が入力されていれば作成できる' do
      expect(@category).to be_valid
    end
  end

  context 'カテゴリ作成できない時' do
    it 'カテゴリが空だと作成できない' do
      @category.category_name = ''
      @category.valid?
      expect(@category.errors.full_messages).to include("Category name can't be blank")
    end
    it 'カテゴリ名が20文字以下でないと作成できない' do
      @category.category_name = '123456789012345678901'
      @category.valid?
      expect(@category.errors.full_messages).to include('Category name is invalid. Please enter at least 20 characters')
    end
  end


end
 

# bundle exec rspec spec/models/category_spec.rb 

# binding.pry

# @category.errors.full_messages