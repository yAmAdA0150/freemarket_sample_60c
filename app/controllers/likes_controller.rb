class LikesController < ApplicationController

  before_action :set_items

  def create
    @like = Like.create(user_id: current_user.id, item_id: @item.id)
    render 'items/create.js.erb'
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, item_id: @item.id)
    @like.destroy
    render 'items/create.js.erb'
  end

  private
  def set_items
    @item = Item.find(params[:item_id])
  end

end