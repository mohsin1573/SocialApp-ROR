class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  belongs_to :parent, class_name: 'Comment', optional: true
  has_many :comments, foreign_key: :parent_id

  #Check Reply limit THROUGH CALLBACK
  before_create :check_reply_limit

  private
  def check_reply_limit
    return unless parent.present? 

    if parent.comments.count >= 5
      errors.add(:base, 'Can not have more than 5 replies')
      throw(:abort)
    end
  end
end
