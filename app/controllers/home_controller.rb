class HomeController < ApplicationController
    before_action :get_categories_for_sidebar

    layout "home"

    def index
        @furnitures = Furniture.all.order(created_at: "DESC")
    end

    def category_search
        @furnitures = Furniture.where(category_id: params[:category_id])
    end

    def get_categories_for_sidebar
        @categories_hash = Furniture.joins(:category).select("category_id, categories.name as category_name, count(*) as category_count").group(:category_id, :category_name)
    end
end
