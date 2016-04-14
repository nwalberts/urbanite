class UpvotesController < ApplicationController
  def create
    @review = Review.find(params[:review_id])
    @user = current_user
    @vote = Vote.new(review: @review, user: @user)
    @vote.value = 1

    respond_to do |format|
      if @vote.save
        # format.html { redirect_to location_path(@review.location) }
        format.json { render json: @review, status: 200 }
        flash[:notice] = "Vote added successfully!"
      else
        # format.html { redirect_to location_path(@review.location) }
        format.json { render :nothing, status: 500 }
        flash[:error] = "Vote not saved."
      end
    end
  end

  def update
    @review = Review.find(params[:review_id])
    @user = current_user
    @vote = Vote.find_by(user_id: @user, review_id: @review)
    @vote.destroy

    respond_to do |format|
      if @vote.save
        # format.html { redirect_to location_path(@review.location) }
        format.json { render json: @review, status: 200 }
        flash[:notice] = "Vote added successfully!"
      else
        # format.html { redirect_to location_path(@review.location) }
        format.json { render :nothing, status: 500 }
        flash[:error] = "Vote not saved."
      end
    end
  end
end
