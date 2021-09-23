class ListsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_user
  before_action :set_category, only: [:new, :create, :show, :edit, :update, :destroy]
  before_action :category_access_check, only: [:new, :create, :show, :edit, :update, :destroy]
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def new
    @list = ListListDeadline.new
  end

  def create
    @list  = ListListDeadline.new(list_params)
    if @list.valid?  
      @list.save
      redirect_to  profile_category_path(@user.profile.id, @category.id)
    else
      render :new
    end 
  end

  def show
    if @list.list_reminds.present?
      @list_reminds = ListRemind.where(list_id: @list.id).order(:list_remind_date).order(list_remind_time: "ASC")
    end 
  end

  def edit
  end

  def update
    if @list.update(only_list_params)
      redirect_to profile_category_list_path(@user.profile.id, @category.id, @list.id)
    else
      render :edit
    end
  end

  def destroy
    @list.destroy
    redirect_to profile_category_path(@user.profile.id, @category.id)
  end

  private
  def get_user
    if user_signed_in?
      @user = User.find(current_user.id)
    end
  end

  def set_category
    @category = Category.find(params[:category_id])
  end

  def category_access_check
    if @category.profile_id != @user.profile.id
      redirect_to root_path
    end
  end

  def list_params
    @category = Category.find(params[:list_list_deadline][:category_id].to_i)
    params.require(:list_list_deadline).permit(
      :category_id, :list_title, :list_detail, :priority_id, 
      :list_deadline_date, :list_deadline_time
    ).merge(category: @category, profile: @user.profile)
  end

  def only_list_params
    @category = Category.find(params[:list][:category_id].to_i)
    params.require(:list).permit(:list_title, :list_detail, :priority_id).merge(category: @category)
  end

  def set_list
    @list = List.find(params[:id]) 
  end
end
