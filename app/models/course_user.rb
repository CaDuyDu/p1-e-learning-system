class CourseUser < ApplicationRecord
  enum status: {not_activated: 0, activated: 1, locked: 2}
  belongs_to :user
  belongs_to :course

  scope :course_of_user, -> (user_id){ where user_id: user_id }
  scope :by_not_activated, -> { where status: 0 }
end
