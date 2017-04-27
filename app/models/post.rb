class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  attr_accessor :image_url
  mount_uploader :image, PostImageUploader
  serialize :image, JSON
end
