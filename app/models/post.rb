class Post < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :short_description, presence: true
  validates :content, presence: true
end
