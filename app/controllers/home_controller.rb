class HomeController < ApplicationController

    layout "home"

    def index
        @furnitures = Furniture.all
    end

end
