class FlightAware::Timetable
  include FlightAware::DateAndTime

  KEYS = [
    :scheduled_out, :estimated_out, :actual_out,
    :scheduled_off, :estimated_off, :actual_off,
    :scheduled_on, :estimated_on, :actual_on,
    :scheduled_in, :estimated_in, :actual_in
  ]

  KEYS.each do |key|
    attr_reader key
  end

  def initialize(flight_json)
    @flight_json = flight_json
    build_timetable_attributes
  end

  def scheduled_taxi_out
    calculate_taxi_time(scheduled_off, scheduled_out)
  end
  
  def estimated_taxi_out
    calculate_taxi_time(estimated_off, estimated_out)
  end

  def scheduled_taxi_in
    calculate_taxi_time(scheduled_in, scheduled_on)
  end

  def estimated_taxi_in
    calculate_taxi_time(estimated_in, estimated_on)
  end

  def show_actual?
    @flight_json[:actual_in] != "null"
  end

  private

  def calculate_taxi_time(time1, time2)
    diff = Time.parse(time1) - Time.parse(time2)
    "#{seconds_to_minutes(diff)}m"
  end

  def build_timetable_attributes
    KEYS.each do |key|
      instance_variable_set("@#{key}", date_string_to_time_string(@flight_json[key]))
    end
  end
end