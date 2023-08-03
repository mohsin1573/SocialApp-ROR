class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Association with posts
  has_many :posts   
  
  has_many :likes, dependent: :destroy
  has_many :comments

  def likes?(post)
    likes.exists?(post_id: post.id)
  end
end
