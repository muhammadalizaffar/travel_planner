class DistancesController < ApplicationController
    
    def create
        @distance = Distance.new(distance_params)
        lat_long = Geocoder.search(@distance.address)
        @distance.latitude = lat_long.first.coordinates[0]
        @distance.longitude = lat_long.first.coordinates[1]
        if @distance.save
            render json: @distance
        end
    end

    def get_routes
        origin = Distance.find_by(category: home)
        destination = Distance.find_by(category: office)
        GeoDirection.get_routes(origin, destination)
    end

    private

    def distance_params
        params.require(:distance).permit(:category, :address)
    end
end
