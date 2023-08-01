class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Association with posts
  has_many :posts   
  
  has_many :likes, dependent: :destroy
end
