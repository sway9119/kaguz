class HomeController < ApplicationController

    layout "home"

    def index
        @furnitures = Furniture.all
        @categories = Category.all
    end

    def category_search
        @furnitures = Furniture.where(category_id: params[:category_id])
        @categories = Category.all
    end

end
