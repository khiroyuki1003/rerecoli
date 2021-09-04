class ListRemindsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_user
  before_action :set_category
  before_action :category_access_check
  before_action :set_list
  before_action :set_list_reminds, only: [:edit, :update, :destroy]

  def new
    @list_remind = ListRemind.new
  end

  def create
    binding.pry
    @list_remind  = ListRemind.new(list_remind_params)
    if @list_remind.save
      redirect_to  profile_category_list_path(@user.profile.id, @category.id, @list.id)
    else
      render :new
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

  def set_list_reminds
    @list_reminds = ListRemind.find(params[:id])
  end

  def list_remind_params
    params.require(:list_remind).permit(:list_remind_date, :list_remind_time, :list_remind_title, :list_remind_detail).merge(list: @list, profile: @user.profile )
  end

end
