class PostReviewsController < ApplicationController
  before_action :authenticate_user!
  
  def rate
    post_review = PostReview.find_or_create_by(user_id: current_user.id, post_id: params["post_id"])
    post_review.score = params["score"].to_i
    respond_to do |format|
      if post_review.save
        format.html { redirect_to post_review.post, notice: "Post rated with #{post_review.score} / 5." }
        format.json { render :show, status: :created, location: post_review }
      else
        format.html { render post_review.post, status: :unprocessable_entity }
        format.json { render json: post_review.errors, status: :unprocessable_entity }
      end
    end
  end
end
