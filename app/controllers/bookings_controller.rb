class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @flight = Flight.find_by(id: params[:booking][:flight_id])
    @passengers = params[:booking][:number_of_passengers].size
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      flash[:notice] = 'Booking successfully saved'
      redirect_to root_path
    else
      flash[:alert] = 'Booking failed to save...'
      render 'new'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:passenger_id, :flight_id, :number_of_passengers)
  end
end
