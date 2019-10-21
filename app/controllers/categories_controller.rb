class CategoriesController < ApplicationController
before_action :header_category

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    if @category.has_children?
      @items = Item.all.where(category_id: @category.descendant_ids)
    else
      @items = @category.items
    end
  end
end
