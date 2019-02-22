class Lessons::WordsController < ApplicationController

  def new
    # @answer = []
    # #@lesson = Lesson.find_by_id(params[:lesson_id])
    # @questions = Lesson.questions(@lesson.category.id)

    # @questions.count.times do 
    #   @answer << Answer.new
    # end
  end

  def create
     
  end


  private 
  def answer_params
    params.require(:answer).permit(:lesson_id,:word_id,:choice_id)
  end 

end
