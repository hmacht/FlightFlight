class FlightController < ApplicationController
  def show
    ident = params[:ident]
    @view_model = FlightViewModel.new(ident)

    unless @view_model.has_flight_data_package?
      flash[:error] = "Cannot find flight. Check tail, date, and time"
      redirect_to root_path
    end
  end
end
