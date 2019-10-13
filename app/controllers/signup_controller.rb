class SignupController < ApplicationController

  require 'payjp'

  before_action :first_validation , only: :sms_confirmation
  before_action :second_validation, only: :address 
  before_action :third_validation, only: :create

  def index
  end

  def registration
    @user = User.new
  end
  
  def sms_confirmation
    session[:name] = user_params[:name]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:first_name] = user_params[:first_name]
    session[:last_name] = user_params[:last_name]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:last_name_kana] = user_params[:last_name_kana]
    session[:birthyear] = user_params[:birthyear]
    session[:birthmonth] = user_params[:birthmonth]
    session[:birthday] = user_params[:birthday]
    @user = User.new
    
  end
  
  def address
    session[:mobile_number] = user_params[:mobile_number]
    @user = User.new
    @user.build_address
  end

  def creditcard
    card = Card.where(user_id: current_user.id)
  end
  
  # コンプリート ログイン状態となる
  def complete
  end
  
  def create
    @user = User.new(
      name: session[:name],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      last_name: session[:last_name], 
      first_name: session[:first_name], 
      last_name_kana: session[:last_name_kana], 
      first_name_kana: session[:first_name_kana], 
      birthyear: session[:birthyear],
      birthmonth: session[:birthmonth],
      birthday: session[:birthday],
      mobile_number: session[:mobile_number],
      uid: session[:uid],
      provider: session[:provider]
        )
    @user.build_address(user_params[:address_attributes])
    if @user.save
      sign_in @user unless user_signed_in?
      redirect_to creditcard_signup_index_path
    else
      render signup_index_path
    end
  end
  
  def payment
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params['payjp-token'].blank?
      redirect_to creditcard_signup_index_path
    else
      customer = Payjp::Customer.create(
      email: current_user.email,
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      ) 
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to complete_signup_index_path
      else
        redirect_to creditcard_signup_index_path
      end
    end
  end

  def first_validation
    session[:name] = user_params[:name]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:last_name] = user_params[:last_name]
    session[:first_name] = user_params[:first_name]
    session[:last_name_kana] = user_params[:last_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
  
    @user = User.new(
      name: session[:name], 
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      last_name: session[:last_name], 
      first_name: session[:first_name], 
      last_name_kana: session[:last_name_kana], 
      first_name_kana: session[:first_name_kana], 
      birthyear: session[:birthyear],
      birthmonth: session[:birthmonth],
      birthday: session[:birthday],
      mobile_number: "12345678901"
    )
    render registration_signup_index_path unless @user.valid?
  end
  
  def second_validation
    session[:mobile_number] = user_params[:mobile_number]
    @user = User.new(
      name: session[:name], 
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      last_name: session[:last_name], 
      first_name: session[:first_name], 
      last_name_kana: session[:last_name_kana], 
      first_name_kana: session[:first_name_kana], 
      birthyear: session[:birthyear],
      birthmonth: session[:birthmonth],
      birthday: session[:birthday],
      mobile_number: session[:mobile_number]
    )
    render sms_confirmation_signup_index_path unless @user.valid?
  end
  
  def third_validation
    session[:address_attributes] = user_params[:address_attributes]
    @user = User.new(
      name: session[:name], 
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      last_name: session[:last_name], 
      first_name: session[:first_name], 
      last_name_kana: session[:last_name_kana], 
      first_name_kana: session[:first_name_kana], 
      birthyear: session[:birthyear],
      birthmonth: session[:birthmonth],
      birthday: session[:birthday],
      mobile_number: session[:mobile_number],
      address_attributes: session[:address_attributes]
    )
    render address_signup_index_path unless @user.valid?
  end

  private
  def user_params
    params.require(:user).permit(
      :name, 
      :email, 
      :password, 
      :password_confirmation, 
      :last_name, 
      :first_name, 
      :last_name_kana, 
      :first_name_kana, 
      :birthyear,
      :birthmonth,
      :birthday,
      :mobile_number,
      address_attributes:[:id,:postcode,:city,:street,:building_name,:phone_number,:prefecture_id]
    )
  end

end
