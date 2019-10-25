class ItemsController < ApplicationController
  before_action :header_category 
  before_action :set_item, except: [:index,:new,:create,:search]
  before_action :set_address, only:[:confirmation, :done]
  require 'payjp'

  def index
    @parents = Category.all.where(ancestry: nil)
    @user = current_user
    @items = Item.all.order("created_at DESC") 
    @category = Category.all.where(id: [1,2,8,6])
    @brand = Brand.all.where(id: [168,197,1625,6541])
  end 

  def show
    @item = Item.find(params[:id])
    @items = Item.order("created_at DESC") 
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
      redirect_to item_path(@item)
    else
      @item.images = []
      @item.images.build
      @parents = Category.all.where(ancestry: nil)
      render :new
    end
  end

  def search
    @items = Item.where('name LIKE(?)',"%#{params[:keyword]}%").limit(20)

  end

  def edit
    @images = Image.where(item_id:params[:id])
  end

  def update
    edit_params = item_params
    image_del_list = delete_images if delete_images
    image_edit_list = edit_params[:images_attributes] if edit_params[:images_attributes]
    edit_params.delete(:images_attributes)
    edit_params = edit_params.merge(size_id: nil) unless edit_params.has_key?(:size_id)
    edit_params = edit_params.merge(brand_id: nil) unless edit_params.has_key?(:brand_id)
    if image_edit_list
      image_edit_list.each do |img|
        Image.create(img.merge(item_id: @item.id))
      end
    end
    if image_del_list
      image_del_list.each do |image_id|
        Image.find(image_id).destroy
      end
    end
    if @item.update(edit_params)
      redirect_to item_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    if @item.user == current_user
      if @item.destroy
        redirect_to user_path(current_user)
      else
        redirect_to item_path(@item)
      end
    else
      render :show
    end
  end

  def confirmation
    @card = Card.find_by(user_id:current_user.id)
      if @card.blank?
        # redirect_to controller: "cards", action: "create"
      else
        Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
        customer = Payjp::Customer.retrieve(@card.customer_id)
        @default_card_information = customer.cards.retrieve(@card.card_id)
      end
  end

  def buy
    @card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    Payjp::Charge.create(
      amount:  @item.price,
      customer: @card.customer_id,
      currency: 'jpy'
    )

    @trading = Trading.new(
      status_id: 1,
      buyer_id: current_user.id,
      seller_id: @item.user.id,
      item_id: @item.id,
    )
    @trading.save

    @item.update(display_id:4)

    redirect_to action: "done"
  end

  def done
    card = Card.where(user_id: current_user.id).first
      if card.blank?
        redirect_to controller: "card", action: "new"
      else
        Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
        customer = Payjp::Customer.retrieve(card.customer_id)
        @default_card_information = customer.cards.retrieve(card.card_id)
      end
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

  def delete_images
    if params.has_key?(:delete_ids)
      return params.require(:delete_ids)
    else
      return nil
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_address
    @address = Address.find(current_user.id)
  end
end
