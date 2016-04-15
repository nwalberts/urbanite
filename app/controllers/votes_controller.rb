class VotesController < ApplicationController
  before_action :pre_vote
  respond_to :html, :json

  def upvote
    @review = Review.find(params[:review_id])
    @user = current_user
<<<<<<< HEAD
=======
    if @vote.value == 1
      @vote.value = 0
    end
>>>>>>> 7a8cb38f142a12701b5ab09c9c2d39c89472e318

    if @vote.value == 1
      @vote.value = 0
    else
      @vote.value = 1
    end
    
    respond_to do |format|
      if @vote.save
        format.json { render json: @review, status: 200 }
      else
        format.json { render :nothing, status: 500 }
      end
    end
  end

  def downvote
    @review = Review.find(params[:review_id])
    @user = current_user
<<<<<<< HEAD


    if @vote.value == -1
      @vote.value = 0
    else
      @vote.value = -1
=======
    if @vote.value == -1
      @vote.value = 0
>>>>>>> 7a8cb38f142a12701b5ab09c9c2d39c89472e318
    end


    respond_to do |format|
      if @vote.save
        format.json { render json: @review, status: 200 }
      else
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
