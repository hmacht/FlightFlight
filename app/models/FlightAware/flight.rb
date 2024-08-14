class FlightAware::Flight
  include FlightAware::DateAndTime

  attr_reader :json
  attr_reader :timetable

  def initialize(json_data)
    @json = find_next_flight(json_data)
    @timetable = FlightAware::Timetable.new(@json)
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
    time = seconds_to_hours_and_minutes(duration)
    
    "#{time[:hours]} hrs #{time[:minutes]} mins"
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