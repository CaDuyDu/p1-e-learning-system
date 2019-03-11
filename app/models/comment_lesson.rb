class CommentLesson < ApplicationRecord
  belongs_to :lesson
  belongs_to :user

  scope :order_by, -> {order created_at: :desc}
end
