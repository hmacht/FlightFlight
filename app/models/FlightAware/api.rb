class FlightAware::Api
  def initialize
    @api_key = ENV["FLIGHT_AWARE_API_KEY"] || ""
  end

  def get_flight_data(ident)
    {
      "links": {
        "next": ""
      },
      "num_pages": 1,
      "flights": [
        {
          "ident": "string",
          "ident_icao": "string",
          "ident_iata": "string",
          "actual_runway_off": "string",
          "actual_runway_on": "string",
          "fa_flight_id": "string",
          "operator": "string",
          "operator_icao": "string",
          "operator_iata": "string",
          "flight_number": "string",
          "registration": "string",
          "atc_ident": "string",
          "inbound_fa_flight_id": "string",
          "codeshares": [
            "string"
          ],
          "codeshares_iata": [
            "string"
          ],
          "blocked": false,
          "diverted": false,
          "cancelled": false,
          "position_only": false,
          "origin": {
            "code": "string",
            "code_icao": "string",
            "code_iata": "string",
            "code_lid": "string",
            "timezone": "America/New_York",
            "name": "LaGuardia",
            "city": "New York",
            "airport_info_url": ""
          },
          "destination": {
            "code": "string",
            "code_icao": "string",
            "code_iata": "string",
            "code_lid": "string",
            "timezone": "America/New_York",
            "name": "LaGuardia",
            "city": "New York",
            "airport_info_url": ""
          },
          "departure_delay": 0,
          "arrival_delay": 0,
          "filed_ete": 0,
          "progress_percent": 0,
          "status": "string",
          "aircraft_type": "string",
          "route_distance": 0,
          "filed_airspeed": 0,
          "filed_altitude": 0,
          "route": "string",
          "baggage_claim": "string",
          "seats_cabin_business": 0,
          "seats_cabin_coach": 0,
          "seats_cabin_first": 0,
          "gate_origin": "string",
          "gate_destination": "string",
          "terminal_origin": "string",
          "terminal_destination": "string",
          "type": "General_Aviation",
          "scheduled_out": "2021-12-31T19:59:59Z",
          "estimated_out": "2021-12-31T19:59:59Z",
          "actual_out": "2021-12-31T19:59:59Z",
          "scheduled_off": "2021-12-31T19:59:59Z",
          "estimated_off": "2021-12-31T19:59:59Z",
          "actual_off": "2021-12-31T19:59:59Z",
          "scheduled_on": "2021-12-31T19:59:59Z",
          "estimated_on": "2021-12-31T19:59:59Z",
          "actual_on": "2021-12-31T19:59:59Z",
          "scheduled_in": "2021-12-31T19:59:59Z",
          "estimated_in": "2021-12-31T19:59:59Z",
          "actual_in": "2021-12-31T19:59:59Z",
          "foresight_predictions_available": true
        }
      ]
    }
  end
end