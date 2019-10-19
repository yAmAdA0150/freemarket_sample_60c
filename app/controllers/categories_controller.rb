class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @parents = Category.all.where(ancestry: nil)
  end

  def show
    @category = Category.find(params[:id])
    if @category.has_children?
      @items = Item.all.where(category_id: @category.descendant_ids)
    else
      @items = @category.items
    end
    # if @category.ancestry == nil
    #   @children = @category.children
    #   @items = []
      
    # elsif @cateogry.ancestry =< 13
    #   @children = @category.children
    #   @items = 
    # else
    #   @siblings = Category.all.where(ancestry: @category.ancestry)
    # end
  end
end
