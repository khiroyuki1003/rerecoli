class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :get_user
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :category_access_check, only: [:show, :edit, :update, :destroy]

  def index
    if user_signed_in? && @user.profile.present? && @user.profile.categories.present?
      @categories = Category.where(profile_id: @user.profile.id)
    end
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    if @category.lists.present?
      @lists = List.where(category_id: @category.id)
    end 
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to profile_category_path(@user.profile.id, @category.id)
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to root_path
  end

  private 
  def get_user
    if user_signed_in?
      @user = User.find(current_user.id)
    end
  end

  def category_params
    params.require(:category).permit(:category_name).merge(profile: @user.profile)
  end

  def set_category    
    @category = Category.find(params[:id])
  end

  def category_access_check
    if @category.profile_id != @user.profile.id
      redirect_to root_path
    end
  end
end
