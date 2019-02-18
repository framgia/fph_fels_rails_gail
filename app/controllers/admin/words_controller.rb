class Admin::WordsController < ApplicationController
    

    def index 
        @category = Category.find_by_id(params[:category_id])
        @words = @category.words.all 
    end

    def new
        @word = Word.new(category_id: params[:category_id]) 
        3.times do  
            @word.choices.build 
        end  
    end

    def create 
        @word = Word.new(word_params)
        
        if @word.save
            flash.now[:success] = "HUHUHUHUHU :D"
            redirect_to admin_category_words_url(params[:category_id])
        else
            flash.now[:danger] = "NANI:?!"
            render 'new'
        end
    end

    def edit 
        @category = Category.find_by_id(params[:category_id])
        @word = Word.find(params[:id])
    end

    def update
        @word = Word.find(params[:id])
        @choices = @word.choices.all
        if @word.update_attributes(word_params) 
          flash[:success] = "Word #{@word.id} has been updated!" 
          redirect_to admin_category_words_url(@word.category_id)
        else
          render 'edit'
        end 
    end

    def destroy
      Word.find(params[:id]).destroy
      flash[:success] = "Word was Deleted!"
      redirect_to admin_category_words_url(params[:category_id])
    end

    private 
    def word_params
        params.require(:word).permit(:content,:category_id, choices_attributes:[:id,:content, :correct])
    end 

    
end
