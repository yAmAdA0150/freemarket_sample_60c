class CardsController < ApplicationController
  
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
    redirect_to new_card_path
  end

  def payment
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params['payjp-token'].blank?
      redirect_to new_user_card_path
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
        redirect_to action: 'new'
      end
    end
  end

  def delete
    card = Card.where(user_id: current_user.id).first
    if card.blank?
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to action: "new"
  end

  def show
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

end
