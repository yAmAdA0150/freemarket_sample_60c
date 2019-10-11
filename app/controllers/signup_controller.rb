class SignupController < ApplicationController

  def index
  end

  def registration
    @user = User.new
  end


  def sms_confimation
    @user = User.new
  end

  def address
    @prefectures = Prefecture.all
    @user = User.new
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
