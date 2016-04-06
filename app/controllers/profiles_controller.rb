class ProfilesController < ApplicationController
  # before_action :authenticate_individual!
  before_action :find_profile, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @profiles = Profile.all
  end

  def new
    @profile = current_user.build_profile
  end

  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      flash[:success] = "Profile saved"
      redirect_to current_user_path
    else
      flash[:error] = "Error"
      render :new
    end
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def edit
  end

  def update
    @profile.update(profile_params)
    respond_with(@profile)
  end

  private

  def find_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :home_location,
                                    :email, :bio, :avatar_url)
  end
end
