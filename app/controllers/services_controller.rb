class ServicesController < ApplicationController
  def apple_maps_token
    render json: { token: ENV["APPLE_MAPS_JS_TOKEN"] }
  end
end
