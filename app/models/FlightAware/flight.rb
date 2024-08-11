class FlightAware::Flight
  attr_reader :json

  def initialize(json_data)
    @json = find_next_flight(json_data)
  end

  def departure
    date_string = data_present?(:actual_out) ? @json[:actual_out] : @json[:scheduled_out]
    parse_date(date_string)
  end

  def arrival
    date_string = data_present?(:actual_in) ? @json[:actual_in] : @json[:scheduled_in]
    parse_date(date_string)
  end

  def duration
    arrival - departure
  end

  def formated_duration
    hours = (duration / 3600).to_i
    minutes = ((duration % 3600) / 60).to_i
    
    "#{hours} hrs #{minutes} mins"
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

  def parse_date(date_string)
    Time.zone.parse(date_string)
  end

  def data_present?(key)
    value = @json[key]
    value.present? && value != "null"
  end

  def title
    "#{@json[:origin][:city]} to #{@json[:destination][:city]}"
  end

  def date_and_flight_num
    "#{tail_number} · #{departure.strftime("%a, %d %b")}"
  end

  def tail_number
    "#{@json[:operator_iata]} #{@json[:flight_number]}"
  end

  private

  def find_next_flight(json_data)
    # TODO: ADD ACTUAL LOGIC TO GET PROPER FLIGHT
    # need to ask for date from user
    json_data[:flights][4]
  end
end