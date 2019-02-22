class LessonsController < ApplicationController

    def create 
        @lesson = Lesson.new(lesson_params)
        if @lesson.save
            redirect_to categories_path
        else
            flash.now[:danger] = "Cannot access lesson!"
            render 'show'
        end
    end

    private
    def lesson_params
        params.require(:lesson).permit(:user_id,:category_id, answers_attributes: [:id,:word_id,:choice_id])
    end

end
