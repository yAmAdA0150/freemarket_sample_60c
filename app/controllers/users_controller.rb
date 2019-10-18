class UsersController < ApplicationController

  def show
    # @user = User.find(params[:id])
    @user = User.new
  end

  def edit
    
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
  end

  def address
    @prefectures = Prefecture.all
  end
  def signout
  end
end
