class LocationsController < ApplicationController
  def index
    if user_signed_in?
      @profile = current_user.profile
    end
    if params[:search]
      @locations = Location.search(params[:search]).order(:name)
    else
      @locations = Location.all.order(:name).page params[:page]
    end
  end

  def show
    @location = Location.find(params[:id])
    @reviews = @location.reviews.order(created_at: :desc).page params[:page]
  end

  def new
    @location = Location.new
    @state_collection = Location::STATES
  end

  def create
    @location = Location.new(location_params)
    @user = current_user

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
    if current_user == @location.user
      @location = Location.find(params[:id])
      if @location.update(location_params)
        flash[:notice] = "Successfully updated city!"
        redirect_to location_path(@location)
      else
        flash[:alert] = "You are not allowed to edit this city!"
        render :edit
      end
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
    ).merge(user: current_user)
  end

  def authorize_user
    if !user_signed_in? || !current_user.admin?
      raise ActionController::RoutingError.new("Not Found")
    end
  end
end
