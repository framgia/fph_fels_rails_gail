class Admin::CategoriesController < ApplicationController

    def index 
      @categories = Category.paginate(page: params[:page], per_page:10)
    end

    def new
      @category = Category.new 
    end
    
    def create
      @category = Category.new(categ_params)
      if @category.save
        redirect_to admin_categories_url
      else
        render 'new'
      end
    end

    def edit 
      @category = Category.find(params[:id])
    end

    def update 
      @category = Category.find(params[:id])
      if @category.update_attributes(categ_params)
        flash[:success] = "Category #{@category.id.to_s} has been updated!" 
        redirect_to admin_categories_url
      else
        render 'edit'
      end 
    end

    def destroy 
      Category.find(params[:id]).destroy
      flash[:success] = "Category was Deleted!"
      redirect_to admin_categories_url
    end

    private
    def categ_params
      params.require(:category).permit(:title,:description)
    end 
end
