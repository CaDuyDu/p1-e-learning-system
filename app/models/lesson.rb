class Lesson < ApplicationRecord
  has_many :lesson_videos, dependent: :destroy
  has_many :homeworks, dependent: :destroy
  has_many :comment_lessons, dependent: :destroy

  belongs_to :course

  scope :order_by, -> {order created_at: :desc}
end
