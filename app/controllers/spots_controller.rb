class SpotsController < ApplicationController
    
  def index
    @spots = Spot.order("created_at DESC").page(params[:page]).per(6)
  end

  def show
    @spot = Spot.find(params[:id])
    @comments = @spot.comments
    @comment = current_user.comments.new
  end

  def new
    @spot = Spot.new
  end

  def create
    @spot = Spot.new(spot_params)
    if @spot.save
      redirect_to root_path
    else
      render action: :new
    end 
  end 

  def edit 
    @spot = Spot.find(params[:id])
  end 

  def update
    @spot = Spot.find(params[:id])
    if @spot.update(spot_params)
      render action: :update
    else
      render action: :edit
    end 
  end 

  def destroy
    @spot = Spot.find(params[:id])
    @spot.destroy
  end 

  private
  def spot_params
    params.require(:spot).permit(:place, :address, :one_word, :thought, :image).merge(user_id: current_user.id)
  end
  
end
