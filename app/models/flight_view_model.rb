class FlightViewModel
  attr_reader :flight_data

  def initialize(ident)
    @ident = ident
    @api = FlightAware::Api.new
  end

  def call
    validate!
    build_flight_data
  end

  private

  def validate!
    raise 'Invalid identifier' unless @ident.present?
  end

  def build_flight_data
    response = @api.get_flight_data(@ident)
    @flight_data = response[:flights].first
  rescue StandardError => e
    raise "Error fetching flight data: #{e.message}"
  end
end