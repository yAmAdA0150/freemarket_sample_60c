class ItemsController < ApplicationController
  
  def index
    @user = current_user
    @item = Item.order('id ASC').limit(20)
  end 

  def show
    # @item = Item.find(params[:id])
    @item = Item.new
  end

  def new
  end

  def create
  end

  def search
    @items = Item.where('name LIKE(?)',"%#{params[:keyword]}%").limit(20)
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
