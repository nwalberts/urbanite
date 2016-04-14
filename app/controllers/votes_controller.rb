class VotesController < ApplicationController
  before_action :pre_vote

  def upvote
    @review = Review.find(params[:review_id])
    @user = current_user
    binding.pry
    while @vote.value < 2
      if @vote.value == 1
        @vote.value = 0
      else
        @vote.value = 1
      end
    end

    respond_to do |format|
      if @vote.save
        # format.html { redirect_to location_path(@review.location) }
        format.json { render json: @review, status: 200 }
      else
        # format.html { redirect_to location_path(@review.location) }
        format.json { render :nothing, status: 500 }
      end
    end
  end

  def downvote
    @review = Review.find(params[:review_id])
    @user = current_user

    while @vote.value < 2
      if @vote.value == -1
        @vote.value = 0
      else
        @vote.value = -1
      end
    end

    respond_to do |format|
      if @vote.save
        # format.html { redirect_to location_path(@review.location) }
        format.json { render json: @review, status: 200 }
      else
        # format.html { redirect_to location_path(@review.location) }
        format.json { render :nothing, status: 500 }
      end
    end
  end

  protected

 def pre_vote
   @review = Review.find(params[:review_id])
   @vote = Vote.find_or_initialize_by(review: @review, user: current_user)
 end
end
