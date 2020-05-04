class Admin::SeatAvailabilitiesController < ApplicationController
	def new
		@seat_availability = SeatAvailability.new
	end
	def create
        @seat_availability = SeatAvailability.new(seat_availability_params)
        restaurant_id = current_restaurant.id
        if @seat_availability.save
        	redirect_to admin_restaurant_top_path
        else
        	render 'new'
        end
    end
    def update
    	@seat_availability = SeatAvailability.find(params[:id])
        restaurant_id = current_restaurant.id
        @seat_availability.save
        redirect_to admin_restaurant_top_path
    end
    def edit
    	@seat_availability = SeatAvailability.find(params[:id])
    end
    private
    def seat_availability_params
		params.require(:seat_availability).permit(:seat_availability,:restaurant_id)
	end
end
