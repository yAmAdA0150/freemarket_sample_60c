class CardsController < ApplicationController
  before_action :load_payjp, only: [:payment, :delete, :show]
  before_action :header_category 
  require 'payjp'

  def new
   @card = Card.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
    card.destroy
    redirect_to new_cards_path
  end

  def payment
    if params['payjp-token'].blank?
      redirect_to new_user_cards_path
    else
      customer = Payjp::Customer.create(
      email: current_user.email,
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      ) 
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        flash.now[:notice] = '登録が完了しました'
        redirect_to action: 'show'
        
      else
        redirect_to action: 'show'
      end
    end
  end

  def delete
    card = Card.find(current_user.id)
    if card.blank?
    else
        customer = Payjp::Customer.retrieve(card.customer_id)
        customer.delete
        card.delete
        card.destroy
    end
      redirect_to action: "show"
  end

  def show
    card = Card.find(current_user.id)
    if card.blank?
      redirect_to action: "new" 
    else
      customer = Payjp::Customer.retrieve(card.customer_id)
      @customer_card= customer.cards.retrieve(card.card_id)
    end
  end

  private
  def load_payjp
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
  end

end
