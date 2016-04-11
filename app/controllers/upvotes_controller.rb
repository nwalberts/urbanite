class UpvotesController < ApplicationController
  # def new
  #   @review = Review.find(params[:review_id])
  #   @user = current_user
    # @vote = Vote.new
  #   @vote.user = @user
  #   @vote.review = @review
  #   @vote.default_vote
  # end

  def create
    @review = Review.find(params[:review_id])
    @user = current_user
    @vote = Vote.new(review: @review, user: @user)
    @vote.value = 1

    if @vote.save
      flash[:notice] = "Vote added successfully!"
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
    @vote.default_vote
    flash[:notice] = "Changed"
    redirect_to location_path(@review.location)
  end
  #
  # private
  #
  # def vote_params
  #   params.require(:vote).permit(:value).merge(user: current_user, review: Review.find(params[:review_id]) )
  # end
end
