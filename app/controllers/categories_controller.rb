class CategoriesController < ApplicationController

    def new
        @category = Category.new 
    end
    
    def create
        @category = Category.new(categ_params)
        if @category.save
            redirect_to category_path
        else
          render 'new'
        end
      end

    private
    def categ_params
      params.require(:category).permit(:title,:description)
    end     
end
