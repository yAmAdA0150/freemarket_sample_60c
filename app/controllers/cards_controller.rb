class CardsController < ApplicationController


  def new
  end

  def show 
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
      redirect_to cards_path
    else
      customer = Payjp::Customer.create(
      email: current_user.email,
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      ) 
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to new_card_path
        flash.now[:notice] = '登録が完了しました'
      else
        redirect_to cards_path
      end
    end
  end

end
