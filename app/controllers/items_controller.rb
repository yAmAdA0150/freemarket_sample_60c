class ItemsController < ApplicationController
  
  def index
    @user = current_user
  end 

  def show
    @item = Item.find(params[:id])
  end

  def new
  end

  def create
  end

  def search
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
