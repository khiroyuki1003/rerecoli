require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  context 'ユーザー登録できる時' do
    it '全ての項目が正しく入力されていれば登録できる' do
      expect(@user).to be_valid
    end
  end 

  context 'ユーザー登録できない時' do
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'emailが重複していると登録できない' do
      another_user = FactoryBot.create(:user)
      @user.email = another_user.email
      @user.valid?
      expect(@user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailに@が含まれていないと登録できない' do
      @user.email = 'hogehoge'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが半角でも6文字以上でないと登録できない' do
      @user.password = 'abc12'
      @user.password_confirmation = 'abc12' 
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordが6文字以上でも半角でないと登録できない' do
      @user.password = 'ABC１２３'
      @user.password_confirmation = 'ABC１２３' 
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid. Half-width alphanumeric only')
    end
    it 'passwordとconfirmation_passwordが一致していないと登録できない' do
      @user.password = 'abc123'
      @user.password_confirmation = '123abc' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end 
  end
end
 

# bundle exec rspec spec/models/user_spec.rb 

# binding.pry

# @user.errors.full_messages