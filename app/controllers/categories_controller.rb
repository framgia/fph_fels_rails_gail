class CategoriesController < ApplicationController
  before_action :logged_in_user
  
  def index
    @categories = Category.paginate(page: params[:page], per_page:10).words_exist
    @user = User.find(current_user.id)

    if params[:learned] == "1" 
      @categories = @user.categories.paginate(page: params[:page], per_page:10)
    elsif  params[:learned] == "0"
      @categories = @categories.where.not(id:@user.category_ids).paginate(page: params[:page], per_page:10)
    end
  end
end
