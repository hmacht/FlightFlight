class FlightAware::Flight
  attr_reader :json

  def initialize(json_data)
    @json = find_next_flight(json_data)
  end

  def departure
    # IF STATUS = SCHEDULED : SCHEDUALED OUT
    # IF STATUS = TOOK OFF : ACTUAL OUT
  end

  def arrival
    # IF STATUS = SCHEDULED : SCHEDUALED OUT
    # IF STATUS = ARRIVED : ACTUAL IN
  end

  def departure_status
    has_departure_delay? ? "Delayed" : "On Time"
  end

  def arrival_status
    has_departure_delay? ? "Delayed" : "On Time"
  end

  def has_departure_delay?
    @json[:departure_delay] > 0
  end

  def has_arrival_delay?
    @json[:arrival_delay] > 0
  end

  def aircraft_type
    @json[:aircraft_type]
  end

  private

  def find_next_flight(json_data)
    json_data[:flights].first
  end
end