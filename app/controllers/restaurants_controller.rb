class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.owner = current_user

    if @restaurant.save
      flash[:notice] = "You are now the proud owner of #{@restaurant.name}!"
      redirect_to restaurants_url
    else
      render :new
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :capacity)
  end
end
