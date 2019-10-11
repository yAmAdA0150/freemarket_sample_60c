class SignupController < ApplicationController

  def index
  end

  def registration
    # session[:name] = user_params[:name]
    # session[:email] = user_params[:email]
    # session[:password] = user_params[:password]
    # session[:password_confirmation] = user_params[:password_confirmation]
    # session[:first_name] = user_params[:first_name]
    # session[:last_name] = user_params[:last_name]
    # session[:first_name_kana] = user_params[:first_name_kana]
    # session[:last_name_kana] = user_params[:last_name_kana]
    # session[:birthyear] = user_params[:birthyear]
    # session[:birthmonth] = user_params[:birthmonth]
    # session[:birthday] = user_params[:birthday]
    @user = User.new
  end


  def sms_confimation
    # session[:phone_number] = profile_params[:phone_number]
    # @user.build_profiles
    @user = User.new
  end

  def address
    @prefectures = Prefecture.all
    @user = User.new
    # @user.build_address
  end

  def creditcard
    @user = User.new

  end

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
    )
    if @user.save
      session[:id] = @user.id
      
      redirect_to 
    else
      render '/signup/registration'
    end
  end

end
