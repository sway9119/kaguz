class HomeController < ApplicationController

    layout "home"

    def index
        @furnitures = Furniture.all
        @categories = Category.all
    end

end
