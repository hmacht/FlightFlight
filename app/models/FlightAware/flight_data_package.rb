class FlightAware::FlightDataPackage
  attr_reader :flight
  attr_reader :aircraft
  attr_reader :owner

  def initialize(ident)
    raise 'Invalid identifier' unless ident.present?

    @ident = ident
    @api = FlightAware::Api.new

    retrieve_flight_data
    retrieve_aircraft_data
    retrieve_owner_data
  end

  private

  def retrieve_flight_data
    response = @api.get_flights(@ident)
    @flight = FlightAware::Flight.new(response)
  # rescue StandardError => e
  #   Rails.logger.error "Error fetching flight data: #{e.message}"
  end

  def retrieve_aircraft_data
    aircraft_type = @flight.aircraft_type
    return unless aircraft_type.present?

    @aircraft = @api.get_aircraft(@fa_flight_id)
  # rescue StandardError => e
  #   Rails.logger.error "Error fetching aircraft data: #{e.message}"
  end

  def retrieve_owner_data
    @owner = @api.get_owner(@ident)[:owner]
  # rescue StandardError => e
  #   Rails.logger.error "Error fetching aircraft data: #{e.message}"
  end
end
  