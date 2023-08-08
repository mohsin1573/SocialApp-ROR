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
  
  #Adding Username column
  before_validation :check_unique_username, on: :create

  private
  def check_unique_username
    existing_user = User.find_by(username: self.username)
    if existing_user
      self.errors.add(:username, "Already taken")
      throw(:abort)
    end
  end

end
