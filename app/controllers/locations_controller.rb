class LocationsController < ApplicationController
  def index
    @locations = Location.all.order(:name)
  end

  def show
    @location = Location.find(params[:id])
  end

  def new
    @location = Location.new
    @state_collection = Location::STATES
  end

  def create
    @location = Location.new(location_params)

    if @location.save
      flash[:notice] = "City added successfully"
      redirect_to location_path(@location)
    else
      @state_collection = Location::STATES
      flash[:error] = @location.errors.full_messages.join(". ")
      render :new
    end
  end

  def location_params
    params.require(:location).permit(
      :name,
      :state,
      :description
    )
  end
end
