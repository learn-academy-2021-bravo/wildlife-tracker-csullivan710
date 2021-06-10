class SightingsController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        sightings = Sighting.where(date: params[:start_date]..params[:end_date])
        render json: sightings
    end
end
