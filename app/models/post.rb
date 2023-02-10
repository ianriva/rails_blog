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

  def self.ransackable_associations(auth_object = nil)
    ["comments", "post_reviews", "user"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["content", "created_at", "id", "short_description", "title", "updated_at", "user_id"]
  end
end
