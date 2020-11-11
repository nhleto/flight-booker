class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    if params[:booking][:flight_id].nil?
      flash[:alert] = 'You must choose a flight...'
      redirect_to root_path
    end
    @flight = Flight.find_by(id: params[:booking][:flight_id])
    passenger_forms = params[:booking][:number_of_passengers].to_i
    passenger_forms.times do
      @booking.passengers.build
    end
  end

  def index
    redirect_to root_path
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      flash[:notice] = 'Booking successfully saved'
      PassengerMailer.with(booking: @booking).thank_you_email.deliver_now
      redirect_to booking_path(@booking)
    else
      flash[:alert] = 'Invalid booking information'
      render 'new'
    end
  end

  def show
    @booking = Booking.find(params[:id])
    flash.now[:notice] = 'Thank you for choosing Flight Booker! Have a great flight!'
  end

  private

  def booking_params
    params.require(:booking).permit(:number_of_passengers, :flight_id, passengers_attributes: [:id, :name, :email])
  end
end
