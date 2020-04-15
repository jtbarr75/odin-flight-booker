class FlightsController < ApplicationController
  def index
    @flights = Flight.includes(:from_airport, :to_airport).where(nil)
    @flights = @flights.filter_by_from(params[:from_airport_id]) if params[:from_airport_id].present?
    @flights = @flights.filter_by_to(params[:to_airport_id]) if params[:to_airport_id].present?
    @flights = @flights.filter_by_start_time(params[:start_time]) if params[:start_time].present?
    @airports = Airport.all
  end
end
