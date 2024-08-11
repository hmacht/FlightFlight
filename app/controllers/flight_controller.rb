class FlightController < ApplicationController
  def show
    ident = params[:ident]
    @view_model = FlightViewModel.new(ident)
  end
end
