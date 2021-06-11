class SightingsController < ApplicationController
    def index
        puts params
        sighting = Sighting.where(date: params[:start_date]..params[:end_date])
        render json: sighting
    end

    def show
        puts params
        sighting = Sighting.find(params[:id])
        render json: sighting
    end

    def create
        sighting = Sighting.create(sighting_params)
        if sighting.valid?
            render json: sighting
        else
            render json: sighting.errors
        end
    end

    def destroy
        sighting = Sighting.find(params[:id])
        if sighting.destroy
            render json: sighting
        else
            render sighting.errors
        end
    end

    def update
        sighting = Sighting.find(params[:id])
        sighting.update(sighting_params)
        if sighting.valid?
        render json: sighting
        else
        render json: sighting.errors
        end
    end

    private 
    def sighting_params
        params.require(:sighting).permit(:animal_id, :date, :latitude, :longitude)
    end

end
