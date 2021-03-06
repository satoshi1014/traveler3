class UsersController < ApplicationController
    
  def show
    @user = User.find(params[:id])
    @spots = @user.spots.order("created_at DESC").page(params[:page]).per(6)
  end 

  def edit 
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
  end 

  private
  def user_params
    params.require(:user).permit(:name, :from, :age, :image)
  end  
  
end
