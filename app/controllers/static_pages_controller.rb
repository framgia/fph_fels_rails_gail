class StaticPagesController < ApplicationController
  before_action :logged_in_user, only:[:dashboard]
  
  def dashboard
    @user = User.find(current_user.id)
    @activities = Activity.dashboard(@user).paginate(page: params[:page], per_page:10)
  end
end
