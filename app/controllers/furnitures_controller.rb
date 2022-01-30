class FurnituresController < ApplicationController

    layout "home"

    def new
        @furniture = Furniture.new
    end

    def create
        @furniture = Furniture.new(furniture_params)
        @furniture.save
        redirect_to root_path
    end

    def show
        @furniture = Furniture.find(params[:id])
    end

    private

    def furniture_params
        params.require(:furniture).permit(:name, :image, :category_id)
    end
end
