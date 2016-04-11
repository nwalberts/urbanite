class DownvotesController < ApplicationController
  def create
    @review = Review.find(params[:review_id])
    @user = current_user
    @vote = Vote.new(review: @review, user: @user)
    @vote.value = -1

    if @vote.save
      flash[:notice] = "Downvoted!"
      redirect_to location_path(@review.location)
    else
      flash[:error] = "Vote not saved."
      redirect_to location_path(@review.location)
    end
  end

  def update
    @review = Review.find(params[:review_id])
    @user = current_user
    @vote = Vote.find_by(user_id: @user, review_id: @review)
    @vote.destroy
    flash[:notice] = "Vote cancelled."
    redirect_to location_path(@review.location)
  end
end
