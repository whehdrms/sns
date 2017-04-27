class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  has_many :likes
  has_many :liked_posts, through: :likes, source: :post


  has_many :follower_relations, foreign_key: "followed_id", class_name: "Follow"
  has_many :followers, through: :follower_relations, source: :follower

  has_many :following_relations, foreign_key: "follower_id", class_name: "Follow"
  has_many :followings, through: :following_relations, source: :followed
  attr_accessor :image_url



  def liked?(post)
    Like.find_by(user_id: self.id, post_id: post.id).present?
  end
end
