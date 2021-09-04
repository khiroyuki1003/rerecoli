class CategoriesController < ApplicationController
  before_action :get_user

  def index
  end


  private 
  def get_user
    if user_signed_in?
      @user = User.find(current_user.id)
    end
  end
end
