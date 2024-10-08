class FlightAware::FlightDataPackage
  attr_reader :flight
  attr_reader :aircraft
  attr_reader :airports
  attr_reader :timetable

  def initialize(ident)
    raise 'Invalid identifier' unless ident.present?

    @ident = ident
    @api = FlightAware::Api.new

    build_flight_data
    build_aircraft_data
    build_airport_data
  end

  private

  def build_flight_data
    response = @api.get_flights(@ident)
    @flight = FlightAware::Flight.new(response)
  # rescue StandardError => e
  #   Rails.logger.error "Error fetching flight data: #{e.message}"
  end

  def build_aircraft_data
    aircraft_type = @flight.aircraft_type
    return unless aircraft_type.present?

    owner = @api.get_owner(@ident)[:owner]
    aircraft = @api.get_aircraft(aircraft_type)

    @aircraft = { 
      details: aircraft, 
      owner: owner, 
      tail_number: @flight.try(:tail_number) || "" 
    }
  # rescue StandardError => e
  #   Rails.logger.error "Error fetching aircraft data: #{e.message}"
  end

  def build_airport_data
    origin_airport_id = @flight.json[:origin][:code_icao]
    destination_airport_id = @flight.json[:destination][:code_icao]
    return {} unless origin_airport_id.present? && destination_airport_id.present?

    origin = @api.get_airport(origin_airport_id)
    destination = @api.get_airport(destination_airport_id)

    @airports = { origin: origin, destination: destination }
  # rescue StandardError => e
  #   Rails.logger.error "Error fetching aircraft data: #{e.message}"
  end
end
  