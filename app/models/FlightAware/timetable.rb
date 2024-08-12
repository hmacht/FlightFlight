class FlightAware::Timetable

  KEYS = [
    :scheduled_out, :estimated_out, :actual_out,
    :scheduled_off, :estimated_off, :actual_off,
    :scheduled_on, :estimated_on, :actual_on,
    :scheduled_in, :estimated_in, :actual_in
  ]

  KEYS.each do |key|
    attr_reader key
  end

  def initialize(flight)
    @flight = flight
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
    @flight.json[:actual_in] != "null"
  end

  private

  def calculate_taxi_time(time1, time2)
    diff = Time.parse(time1) - Time.parse(time2)
    diff_in_minutes = (diff / 60.0).to_i

    "#{diff_in_minutes}m"
  end

  def build_timetable_attributes
    KEYS.each do |key|
      instance_variable_set("@#{key}", parse_date(@flight.json[key]))
    end
  end

  def parse_date(date_string)
    return "null" if date_string == "null"
    Time.zone.parse(date_string).strftime("%-I:%M %p")
  end
end