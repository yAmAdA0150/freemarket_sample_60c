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
    @parents = Category.all.where(ancestry: nil)
    @item = Item.new
    @item.images.build
    @item.build_shipping
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to 
    else
      @item.images = []
      @item.images.build
      render :new
    end
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

  private
  def item_params
    params.require(:item).permit(
      :name,
      :price,
      :text,
      :category_id,
      :brand_id,
      :size_id,
      :condition_id,
      :display_id,
      shipping_attributes: [:id,:delivery_method_id,:prefecture_id, :charge, :term_id],
      images_attributes: [:url]
      )
      .merge(user_id: current_user.id)
  end
end
