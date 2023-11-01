# frozen_string_literal: true

# class
class HomeController < ApplicationController
  before_action :get_categories_for_sidebar

  layout 'home'

  def index; end

  def get_categories_for_sidebar
    @categories_hash = Furniture.joins(:category).select('category_id, categories.name as category_name, count(*) as category_count').group(
      :category_id, :category_name
    )
  end
end
