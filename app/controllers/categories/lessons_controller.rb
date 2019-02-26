class Categories::LessonsController < ApplicationController

  def new
    @category = Category.find_by_id(params[:category_id])
    @lesson = Lesson.new
    @lesson.answers.build
  end

  def create
    @category = Category.find(params[:category_id])
    @lesson = Lesson.new(lesson_params)
    if @lesson.save
      redirect_to categories_path
    else
      render 'new'
    end
  end
    
  private
    def lesson_params
        params.require(:lesson).permit(:user_id,:category_id, answers_attributes: [:id,:word_id,:choice_id])
    end
end
