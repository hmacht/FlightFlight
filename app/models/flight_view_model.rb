class FlightViewModel
  attr_reader :flight_data_package

  def initialize(ident)
    @ident = ident

    validate!
    set_flight_data_package
  end

  def has_flight_data_package?
    @flight_data_package.present? && @flight_data_package.flight.present?
  end

  private

  def validate!
    raise 'Invalid identifier' unless @ident.present?
  end

  def set_flight_data_package
    @flight_data_package = FlightAware::FlightDataPackage.new(@ident)
  end
end