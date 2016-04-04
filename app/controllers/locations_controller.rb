class LocationsController < ApplicationController
  def index
    @locations = Location.all.order(:name)
  end

  def new
  end

  def create
  end
end
