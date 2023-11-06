# frozen_string_literal: true

# これはFurnituresControllerクラスです。
# このクラスは家具に関連するアクションを処理します。
class FurnituresController < ApplicationController
  before_action :create_categories_hash
  before_action :create_scenes_hash

  layout 'application'

  def index
    @furnitures = Furniture.all.order(created_at: 'DESC')
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
    filter_conditions = []

    filter_conditions << ['material_id IN (?)', params[:material_ids]] if params[:material_ids].present?
    filter_conditions << ['color_id IN (?)', params[:color_ids]] if params[:color_ids].present?

    size_attributes = %w[width height depth]
    size_attributes.each do |attribute|
      filter_conditions.concat(range_conditions(attribute, "size_#{attribute}"))
    end

    price_attributes = %w[price]
    price_attributes.each do |attribute|
      filter_conditions.concat(range_conditions(attribute, attribute.to_s))
    end

    where_clause = filter_conditions.map(&:first).join(' AND ')
    where_values = filter_conditions.flat_map { |condition| condition[1] }

    @furnitures = Furniture.where(where_clause, *where_values)

    render 'index'
  end

  def keyword_search
    @furnitures = Furniture.where('name LIKE ?', "%#{params[:keyword]}%")
    render 'index'
  end

  def create_categories_hash
    @categories_hash = Furniture.with_category_info
  end

  def create_scenes_hash
    @scenes_hash = Furniture.with_scene_info
  end

  def new
    @furniture = Furniture.new
  end

  def create
    @furniture = Furniture.new(furniture_params)
    if @furniture.save
      flash[:success] = '新しい家具を投稿しました。'
      redirect_to root_path
    else
      flash[:danger] = '新しい家具を投稿できませんでした。'
      render 'new'
    end
  end

  def show
    @furniture = Furniture.find(params[:id])
    @related_furnitures = Furniture.all.limit(6)
  end

  private

  def range_conditions(attribute, param_base)
    conditions = []
    from_value = params["#{param_base}_from"]
    to_value = params["#{param_base}_to"]
    if from_value.present? && to_value.present?
      conditions << ["#{attribute} BETWEEN ? AND ?", from_value, to_value]
    elsif from_value.present?
      conditions << ["#{attribute} >= ?", from_value]
    elsif to_value.present?
      conditions << ["#{attribute} <= ?", to_value]
    end
    conditions
  end

  def furniture_params
    params.require(:furniture)
          .permit(
            :name,
            :image,
            :category_id,
            scene_ids: [],
            material_ids: [],
            color_ids: []
          )
  end
end
