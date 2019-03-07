class WordsController < ApplicationController
  before_action :logged_in_user
  
  def index
    @user = User.find(current_user.id)
    @answers = @user.answers.paginate(page: params[:page], per_page:10)

    if params[:category].present?
      @answers = @user.answers.where("lessons.category_id = ?", params[:category]).paginate(page: params[:page], per_page:10)
    else
      @answers.paginate(page: params[:page], per_page:10)
    end

  end
end
