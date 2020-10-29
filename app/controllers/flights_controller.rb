class FlightsController < ApplicationController
  def index
    @flight = Flight.all
  end

  def show
    @flight = Flight.find(params[:id])
  end
end
