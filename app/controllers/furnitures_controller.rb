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
        render 'index'
    end

    def get_categories_for_sidebar
        @categories_hash = Furniture.joins(:category).select("category_id, categories.name as category_name, count(*) as category_count").group(:category_id, :category_name)
    end

    def get_scenes_for_sidebar
        @scenes_hash = Furniture.joins(:scenes).select("scene_id, scenes.name as scene_name, count(*) as scene_count").group(:scene_id, :scene_name)
    end

    def get_material_for_sidebar
        @materials = [
            "木材",
            "金属",
            "石材",
            "テキスタイル",
            "革・レザー",
            "ガラス",
            "陶磁器",
            "土木材",
            "紙",
            "左官材",
            "メラミン・樹脂・プラスチック",
            "その他"
        ]
    end

    def get_color_for_sidebar
        @colors_hash = [
            {id:  1, name: "レッド", klass: "sidebar-color sidebar-color_red"},
            {id:  2, name: "オレンジ", klass: "sidebar-color sidebar-color_orange"},
            {id:  3, name: "イエロー", klass: "sidebar-color sidebar-color_yellow"},
            {id:  4, name: "グリーン", klass: "sidebar-color sidebar-color_green"},
            {id:  5, name: "ブルー", klass: "sidebar-color sidebar-color_blue"},
            {id:  6, name: "パープル", klass: "sidebar-color sidebar-color_purple"},
            {id:  7, name: "ピンク", klass: "sidebar-color sidebar-color_pink"},
            {id:  8, name: "ブラウン", klass: "sidebar-color sidebar-color_brown"},
            {id:  9, name: "ブラウン", klass: "sidebar-color sidebar-color_brown"},
            {id: 10, name: "ベージュ", klass: "sidebar-color sidebar-color_beige"},
            {id: 11, name: "ホワイト", klass: "sidebar-color sidebar-color_white"},
            {id: 12, name: "グレー", klass: "sidebar-color sidebar-color_grey"},
            {id: 13, name: "ブラック", klass: "sidebar-color sidebar-color_black"},
            {id: 14, name: "ゴールド", klass: "sidebar-color sidebar-color_gold"},
            {id: 15, name: "クリア", klass: "sidebar-color sidebar-color_clear"},
            {id: 16, name: "マルチ", klass: "sidebar-color sidebar-color_multi"}
        ]
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
        params.require(:furniture).permit(:name, :image, :category_id, scene_ids:[])
    end
end
