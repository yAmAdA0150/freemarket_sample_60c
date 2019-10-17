class Api::CategoriesController < ApplicationController
  def index

    if params[:brand].present?
      @brands = Brand.where('name LIKE(?)', "#{params[:brand]}%")
    else
      @children = Category.all.where(ancestry: "#{params[:parent]}")
      @gchildren = Category.all.where(ancestry: "#{params[:child]}")
      @category = Category.where(id:"#{params[:size]}").first
      @sizes = @category&.sizes
    end
    respond_to do |format|
      format.html
      format.json
    end
  end
  
end