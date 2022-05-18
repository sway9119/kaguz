class FurnituresController < ApplicationController
    before_action :get_categories_for_sidebar
    before_action :get_scenes_for_sidebar
    before_action :get_material_for_sidebar
    before_action :get_color_for_sidebar

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
        # blankの判定のために、空文字を取り除く
        material_ids = params[:material_ids].reject(&:empty?)
        color_ids = params[:color_ids].reject(&:empty?)

        # TODO: フィルタリング項目が増えると複雑となるため、後日リファクする
        if material_ids.blank? && color_ids.blank?
            @furnitures = Furniture.all
        elsif material_ids.present? && color_ids.present?
            @furnitures = Furniture.where(material_id: material_ids)
            .where(color_id: color_ids)
        elsif material_ids.present?
            @furnitures = Furniture.where(material_id: material_ids)
        elsif params[:color_ids].present?
            @furnitures = Furniture.where(color_id: color_ids)
        end
        render 'index'
    end

    def keyword_search 

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
        params.require(:furniture).permit(:name, :image, :category_id, scene_ids:[], material_ids:[], color_ids:[])
    end
end
