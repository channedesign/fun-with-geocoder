class PlacesController < ApplicationController
  def index
  	@places = Place.by_created_at
  end

  def show
  	@place = Place.find(params[:id])
  end

  def new
  	@place = Place.new
  end

  def create
  	@place = Place.new(place_params)

  	if @place.save!
  		redirect_to root_path, notice: 'Place added successfully!'
  	else
  		render :new
  	end
  end

  private
  	def place_params
  		params.require(:place).permit(:address, :title, :visited_by)
  	end

end
