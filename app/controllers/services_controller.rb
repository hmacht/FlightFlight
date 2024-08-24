class ServicesController < ApplicationController
  def apple_maps_token
    puts "kajsfbjkasbf: #{ENV["APPLE_MAPS_JS_TOKEN"]}"
    render json: { token: ENV["APPLE_MAPS_JS_TOKEN"] }
  end
end
