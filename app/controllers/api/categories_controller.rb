class Api::CategoriesController < ApplicationController
  def index

    if params[:brand].present?
      @brands = Brand.where('name LIKE(?)', "#{params[:brand]}%")
    elsif params[:child].present?
      child = Category.all.where(id: "#{params[:child]}").first
      @gchildren = child.children
    else
      @children = Category.all.where(ancestry: "#{params[:parent]}")
      @category = Category.where(id:"#{params[:size]}").first
      @sizes = @category&.sizes
    end
    respond_to do |format|
      format.html
      format.json
    end
  end
  
end