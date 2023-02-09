class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :post_reviews
  validates :title, presence: true
  validates :short_description, presence: true
  validates :content, presence: true

  def rate
    if self.post_reviews.present?
      self.post_reviews.pluck(:score).sum/self.post_reviews.length
    else
      0
    end
  end
end
