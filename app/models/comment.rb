class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :body, presence: true
  validate :user_cannot_comment_on_own_post

  private

  def user_cannot_comment_on_own_post
    errors.add(:user, "Can't comment on own post") if user_id == post.user_id
  end
end
