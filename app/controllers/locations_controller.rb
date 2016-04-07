class LocationsController < ApplicationController
  def index
    @locations = Location.all.order(:name)
    if user_signed_in?
      @profile = current_user.profile
    end
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

  def edit
    @state_collection = Location::STATES
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])

    if @location.update(location_params)
      flash[:notice] = "Successfully updated city!"
      redirect_to location_path(@location)
    else
      flash[:alert] = "You are not allowed to edit this city!"
      render :edit
    end
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    flash[:notice] = "Successfully deleted city!"
    redirect_to locations_path
  end

  private

  def location_params
    params.require(:location).permit(
      :name,
      :state,
      :description
    )
  end
end
