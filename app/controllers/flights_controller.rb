class FlightsController < ApplicationController
  def index
    if params[:search]
      @flights = Flight.where(from_airport_id: params[:search][:from_airport],
                              to_airport_id: params[:search][:to_airport], start: Date.parse(params[:search][:date]).all_day)
    else
      @flights = Flight.all
    end
  end
end
