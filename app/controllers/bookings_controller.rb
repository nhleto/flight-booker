class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @flight = Flight.find_by(id: params[:booking][:flight_id])
    passenger_forms = params[:booking][:number_of_passengers].to_i
    passenger_forms.times do
      @booking.passengers.build
    end
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      flash[:notice] = 'Booking successfully saved'
      redirect_to booking_path(@booking)
    else
      flash[:alert] = 'Booking failed to save...'
      render 'new'
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:number_of_passengers, :flight_id, passengers_attributes: [:id, :name, :email])
  end
end
