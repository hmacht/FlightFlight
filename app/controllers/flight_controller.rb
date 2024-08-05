class FlightController < ApplicationController
  def show
    ident = params[:ident]
    @view_model = FlightViewModel.new(ident)

    begin
      @view_model.call
    rescue => e
      @error = e.message
    end
  end
end
