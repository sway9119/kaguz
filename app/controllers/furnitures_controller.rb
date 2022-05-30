class FurnituresController < ApplicationController
    before_action :get_categories_for_sidebar
    before_action :get_scenes_for_sidebar

    layout "application"

    def index
        @furnitures = Furniture.all.order(created_at: "DESC")
    end

    def category_search
        @furnitures = Furniture.where(category_id: params[:category_id])
        @category = Category.find(params[:category_id])
        render 'index'
    end

    def scene_search
        @furnitures = Scene.find(params[:scene_id]).furnitures
        @scene = Scene.find(params[:scene_id])
        render 'index'
    end

    def filter_search

        @furnitures = Furniture.all

        material_ids = params[:material_ids].reject(&:empty?)
        if material_ids.present?
            @furnitures = @furnitures.where(material_id: material_ids)
        end

        color_ids = params[:color_ids].reject(&:empty?)
        if color_ids.present?
            @furnitures = @furnitures.where(color_id: color_ids)
        end

        size_width_from = params[:size_width_from]
        if size_width_from.present?
            @furnitures = @furnitures.where("width >= #{size_width_from}")
        end
        size_width_to = params[:size_width_to]
        if size_width_to.present?
            @furnitures = @furnitures.where("width <= #{size_width_to}")
        end

        size_height_from = params[:size_height_from]
        if size_height_from.present?
            @furnitures = @furnitures.where("height >= #{size_height_from}")
        end
        size_height_to = params[:size_height_to]
        if size_height_to.present?
            @furnitures = @furnitures.where("height <= #{size_height_to}")
        end

        size_depth_from = params[:size_depth_from]
        if size_depth_from.present?
            @furnitures = @furnitures.where("depth >= #{size_depth_from}")
        end
        size_depth_to = params[:size_depth_to]
        if size_depth_to.present?
            @furnitures = @furnitures.where("depth <= #{size_depth_to}")
        end

        price_from = params[:price_from]
        if price_from.present?
            @furnitures = @furnitures.where("price >= #{price_from}")
        end
        price_to = params[:price_to]
        if price_to.present?
            @furnitures = @furnitures.where("price <= #{price_to}")
        end        

        render 'index'
    end

    def keyword_search
        @furnitures = Furniture.where('name LIKE ?', "%#{params[:keyword]}%")
        render 'index'
    end

    def get_categories_for_sidebar
        @categories_hash = Furniture.joins(:category).select("category_id, categories.name as category_name, count(*) as category_count").group(:category_id, :category_name)
    end

    def get_scenes_for_sidebar
        @scenes_hash = Furniture.joins(:scenes).select("scene_id, scenes.name as scene_name, count(*) as scene_count").group(:scene_id, :scene_name)
    end

    def new
        @furniture = Furniture.new
    end

    def create
        @furniture = Furniture.new(furniture_params)
        if @furniture.save
            flash[:success] = "新しい家具を投稿しました。"
            redirect_to root_path
        else
            flash[:danger] = "新しい家具を投稿できませんでした。"
            render 'new'
        end
    end

    def show
        @furniture = Furniture.find(params[:id])
    end

    private

    def furniture_params
        params.require(:furniture)
        .permit(
            :name, 
            :image, 
            :category_id, 
            scene_ids:[], 
            material_ids:[], 
            color_ids:[]
            )
    end
end

