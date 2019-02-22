class CategoriesController < ApplicationController

  def index
    @categories = Category.paginate(page: params[:page], per_page:10).words_exist
  end

  def show 
    @category = Category.find_by_id(params[:id])
    @lesson = Lesson.new
    @lesson.answers.build
    
  end

  private 
  def lesson_params
    params.require(:lesson).permit(:user_id,:category_id,answers_attirbutes: [:id,:word_id,:choice_id])
  end
end
