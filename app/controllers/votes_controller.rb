class VotesController < ApplicationController
  def new
    @review = Review.find(params[:review_id])
    @vote = Vote.new
    # if user_signed_in?
    #   @user = current_user
    # end
  end

  def create
    @vote = vote.new(vote_params)

    if @vote.save
      flash[:notice] = "Vote added successfully!"
      redirect_to location_path(@location)
    else
      flash[:error] = "Vote must have rating."
      render :new
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:value).merge(user: current_user, review: Review.find(params[:review_id]) )
  end
end
