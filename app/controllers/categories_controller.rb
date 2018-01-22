class CategoriesController < ApplicationController
    
    def show
        # binding.pry
        @category = Category.find(params[:id])
        @items = @category.items
    end 

end
