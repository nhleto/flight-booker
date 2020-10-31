class FlightsController < ApplicationController
  def index
    @flights = Flight.where(from_airport_id: params[:search][:from_airport],
                            to_airport_id: params[:search][:to_airport], start: Date.parse(params[:search][:date]).all_day)
                            # the query works when 'start' is removed
  end
end
