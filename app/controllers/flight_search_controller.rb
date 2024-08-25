class FlightSearchController < ApplicationController
  def new
    @model = FlightSearchViewModel.new
  end

  def create
    @model = FlightSearchViewModel.new(flight_search_params)

    if @model.valid?
      redirect_to flight_path(ident: @model.tail_number, date: @model.date, time: @model.time)
    else
      # @model.time = nil
      # @model.date = nil

      render :new
    end
  end

  private

  def flight_search_params
    params.require(:flight_search_view_model).permit(:date, :tail_number, :time)
  end
end