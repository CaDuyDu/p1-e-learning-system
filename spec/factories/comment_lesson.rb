FactoryBot.define do
  factory :comment_lesson do
    content { Faker::ProgrammingLanguage.name }

    after (:build) do |comment_lesson|
      lesson = FactoryBot.create :lesson
      user = FactoryBot.create :user

      comment_lesson.lesson_id = lesson.id
      comment_lesson.user_id = user.id
    end
  end
end
