class ReservationsController < ApplicationController
  before_filter :load_restaurant

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    @restaurant.reservations << @reservation

    if @restaurant.save
      flash[:notice] = "Reservation booked at #{@restaurant.name}"
      redirect_to restaurants_path
    else
      render :new
    end
  end

  def show
  end

  def destroy
  end

  private
  def reservation_params
    params.require(:reservation).permit(:party_size, :time)
  end

  def load_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
