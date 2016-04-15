class ReviewsController < ApplicationController
  def new
    @location = Location.find(params[:location_id])
    @review = Review.new
    @rating_collection = [1, 2, 3, 4, 5]
    if user_signed_in?
      @profile = current_user.profile
    end
  end

  def create
    @review = Review.new(review_params)
    @user = current_user
    @location = Location.find(params[:location_id])
    @rating_collection = [1, 2, 3, 4, 5]

    if @review.save
      ReviewMailer.new_review(@review).deliver_later
      flash[:notice] = "Review added successfully!"
      redirect_to location_path(@location)
    else
      flash[:error] = "Review must have rating."
      render :new
    end
    if user_signed_in?
      @profile = current_user.profile
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  def destroy
    @review = Review.find(params[:id])
    @location = @review.location
    @review.destroy
    flash[:notice] = "Successfully deleted review!"
    redirect_to location_path(@location)
  end

  def edit
    @review = Review.find(params[:id])
    @location = @review.location
    @rating_collection = [1, 2, 3, 4, 5]
  end

  def update
    @review = Review.find(params[:id])
    @location = @review.location
    @rating_collection = [1, 2, 3, 4, 5]
    if current_user == @review.user
      @review = Review.find(params[:id])
      if @review.update(review_params)
        flash[:notice] = "Successfully updated review!"
        redirect_to location_path(@location)
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body).merge(location: Location.find(params[:location_id]), user: current_user)
  end
end
