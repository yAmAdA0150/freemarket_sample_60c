class Api::CategoriesController < ApplicationController
  def index
    @children = Category.all.where(ancestry: "#{params[:parent]}")
    @gchildren = Category.all.where(ancestry: "#{params[:child]}")
    respond_to do |format|
      format.html
      format.json
    end
  end
end