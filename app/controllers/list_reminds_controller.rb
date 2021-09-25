class ListRemindsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_user
  before_action :set_category
  before_action :category_access_check
  before_action :set_list
  before_action :set_list_remind, only: [:show, :edit, :update, :destroy, :done]

  def new
    @list_remind = ListRemind.new
  end

  def create
    @list_remind  = ListRemind.new(list_remind_params)
    if @list_remind.save
      redirect_to  profile_category_list_path(@user.profile.id, @category.id, @list.id)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @new_list_remind = ListRemind.new(list_remind_params)
    if @new_list_remind.save
      @list_remind.destroy
      redirect_to profile_category_list_list_remind_path(@user.profile.id, @category.id, @list.id, @new_list_remind.id)
    else
      render :edit
    end
  end 

  def destroy
    @list_remind.destroy
    redirect_to profile_category_list_path(@user.profile.id, @category.id, @list.id)
  end

  def done
    if @list_remind.status == "unfinished" 
      @list_remind.update(status: "done")
      @user = User.find(current_user.id)
      @category = Category.find(params[:category_id])
      @list = List.find(params[:list_id]) 
      redirect_to request.referer
    else
      @list_remind.update(status: "unfinished")
      @user = User.find(current_user.id)
      @category = Category.find(params[:category_id])
      @list = List.find(params[:list_id]) 
      redirect_to request.referer
    end
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

  def set_list
    @list = List.find(params[:list_id]) 
  end

  def set_list_remind
    @list_remind = ListRemind.find(params[:id])
  end

  def list_remind_params
    params.require(:list_remind).permit(:list_remind_date, :list_remind_time, :list_remind_title, :list_remind_detail).merge(list: @list, profile: @user.profile )
  end

end
