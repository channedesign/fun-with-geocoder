class DistancesController < ApplicationController
  def new
  	@places = Place.all
  end

  def create
  	@from = Place.find(params[:from])
  	@to = Place.find(params[:to])

  	if @to && @from
  		flash[:success] = "The distance from <strong>#{@from.title}</strong> to <strong>#{@to.title}</strong> is #{@from.distance_from(@to.to_coordinates)} km."
  		redirect_to new_distance_path
  	else
  		flash[:danger] = "The distance from <strong>#{@from.title}</strong> to <strong>#{@to.title}</strong> could not be calulate...:("
  		render :new
  	end
  end
end
