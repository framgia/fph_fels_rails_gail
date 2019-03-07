class Admin::WordsController < ApplicationController
  before_action :logged_in_user
  before_action :is_admin

  def index 
    @category = Category.find_by_id(params[:category_id])
    @words = @category.words
  end

  def new
    @word = Word.new(category_id: params[:category_id]) 
    3.times do  
      @word.choices.build 
    end  
  end

  def create 
    @category = Category.find(params[:category_id])
    @word = @category.words.new(word_params)
    if @word.save
      flash.now[:success] = "You added a new word!"
      redirect_to admin_category_words_url(params[:category_id])
    else
      flash.now[:danger] = "You added a new word!"
      render 'new'
    end
  end

  def edit 
    @category = Category.find_by_id(params[:category_id])
    @word = Word.find(params[:id])
  end

  def update
    @word = Word.find(params[:id])
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
        params.require(:word).permit(:content, choices_attributes:[:id,:content, :correct])
    end   
end
