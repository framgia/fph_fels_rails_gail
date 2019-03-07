class UsersController < ApplicationController
  before_action :logged_in_user, except: [:new, :create]
  before_action :correct_user,only: [:edit, :update]

  def show 
    @user = User.find(params[:id])
    @activities = Activity.where(user: @user).paginate(page: params[:page], per_page:10)
  end

  def new
    @user = User.new 
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params) 
      flash[:success] = "Profile has been updated!" 
      redirect_to user_url(@user)
    else
      render 'edit'
    end 
  end

  def index 
    #excludes the current user
    @users = User.where.not(id:current_user.id).paginate(page: params[:page], per_page:10)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user 
      redirect_to @user
    else
      render 'new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name,:email,:password,:password_confirmation,:picture)
    end  
end
