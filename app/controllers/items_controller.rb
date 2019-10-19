class ItemsController < ApplicationController
  
  def index
    @user = current_user
    @items = Item.all.order("created_at DESC") 
    @category = Category.all.where(id: [1,2,8,6])
    @brand = Brand.all.where(id: [168,197,1625,6541])
  end 

  def show
    @item = Item.find(params[:id])
    @items = Item.all.order("created_at DESC") 
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
      redirect_to root_path
    else
      @item.images = []
      @item.images.build
      redirect_to new_item_path
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

  # def index
  #   card = Card.where(user_id: current_user.id).first
  #   if card.blank?
  #     redirect_to controller: "card", action: "new"
  #   else
  #     Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
  #     customer = Payjp::Customer.retrieve(card.customer_id)
  #     @default_card_information = customer.cards.retrieve(card.card_id)
  #   end
  # end

  def pay
    @item = Item.find(params[:id])
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    charge = Payjp::Charge.create(
      amount: @item.price,
      card: params['payjp-token'],
      currency: 'jpy'
    )
    # 購入完了画面に遷移
    redirect_to action: :done
  end

  def done
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
