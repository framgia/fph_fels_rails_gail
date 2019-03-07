class Categories::LessonsController < ApplicationController
  before_action :logged_in_user
  
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
      activity = @lesson.create_activity(user: current_user)
      if activity.save
        redirect_to category_lesson_path(@category,@lesson)
      end
    else
      render 'new'
    end
  end

  def show 
    @lesson = Lesson.find(params[:id])
  end
    
  private
    def lesson_params
        params.require(:lesson).permit(answers_attributes: [:id,:word_id,:choice_id])
    end
end
