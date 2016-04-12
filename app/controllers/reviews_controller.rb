class ReviewsController < ApplicationController
  def new
    @location = Location.find(params[:location_id])
    @review = Review.new
    @rating_collection = [1, 2, 3, 4, 5]
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
  end

  def show
    @review = Review.find(params[:id])
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body).merge(location: Location.find(params[:location_id]), user: current_user)
  end
end
