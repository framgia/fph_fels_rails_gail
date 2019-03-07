class WordsController < ApplicationController
  before_action :logged_in_user
  
  def index
    @user = User.find(current_user.id)
    @answers = @user.answers

    if params[:category].present?
      @answers = @user.answers.where("lessons.category_id = ?", params[:category])
    else
      @answers
    end

  end
end
