class Homework < ApplicationRecord
  has_many :homeworks_details, dependent: :destroy
  belongs_to :lesson

  validates :name_homework, presence: true
  validates :lesson_number, presence: true
  validates :total_exercise, presence: true

  scope :order_asc, -> {order created_at: :asc }
  scope :by_role, -> (role){ where role: role }
end
