class HomeController < ApplicationController

    layout "home"

    def index
        @furnitures = Furniture.all.order(created_at: "DESC")
        @categories = Category.all
    end

    def category_search
        @furnitures = Furniture.where(category_id: params[:category_id])
        @categories = Category.all
    end

end
