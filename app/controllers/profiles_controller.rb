class ProfilesController < ApplicationController
  # before_action :authenticate_individual!
  before_action :find_profile, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @profiles = Profile.all
    @users = User.all
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
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        # format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        # format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def find_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:bio, :avatar)
  end
end
