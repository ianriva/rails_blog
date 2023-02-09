class PostReview < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates :score, inclusion: { in: 1..5, message: "%{value} is not between 1 and 5" }
  validate :user_cannot_rate_own_post

  private

  def user_cannot_rate_own_post
    errors.add(:user, "Can't rate your own post") if user_id == post.user_id
  end
end
