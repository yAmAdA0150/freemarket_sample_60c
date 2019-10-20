class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])

  end

  def edit
    @user = User.find(params[:id])
  end

  def update 
    
  end

  def destroy 
    
    @user = current_user
    if @user.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def profile
    @user = User.find(params[:id])
  end

  def address
    @prefectures = Prefecture.all
  end
  def signout
    @user = User.find(params[:id])
  end
end
