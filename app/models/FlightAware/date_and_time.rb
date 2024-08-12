module FlightAware::DateAndTime
  def parse_date(date_string)
    return if date_string == "null"
    Time.zone.parse(date_string)
  end

  def seconds_to_hours_and_minutes(sec)
    hours = (sec / 3600).to_i
    minutes = ((sec % 3600) / 60).to_i
    
    { hours: hours, minutes: minutes }
  end

  def seconds_to_minutes(sec)
    (sec / 60.0).to_i
  end

  def date_string_to_time_string(date_string)
    parsed_time = parse_date(date_string)
    return unless parsed_time.present?

    parsed_time.strftime("%-I:%M %p")
  end
end
