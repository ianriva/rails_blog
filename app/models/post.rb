class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :title, presence: true
  validates :short_description, presence: true
  validates :content, presence: true
end
