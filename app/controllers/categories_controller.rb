class CategoriesController < ApplicationController

  def index
    @categories = Category.paginate(page: params[:page], per_page:10).words_exist
  end
end
