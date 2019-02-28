class Categories::LessonsController < ApplicationController

  def new
    @category = Category.find_by_id(params[:category_id])
    @lesson = Lesson.new
    @category.words.each { |word| @lesson.answers.build(word: word) }
  end

  def create
    @category = Category.find(params[:category_id])
    @lesson = @category.lessons.build(lesson_params)
    @lesson.user_id = current_user.id
     if @lesson.save
      redirect_to categories_path
    else
      render 'new'
    end
  end
    
  private
    def lesson_params
        params.require(:lesson).permit(answers_attributes: [:id,:word_id,:choice_id])
    end
end
