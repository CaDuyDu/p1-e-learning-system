FactoryBot.define do
  factory :lesson do
    title { Faker::ProgrammingLanguage.name  }
    content { Faker::ProgrammingLanguage.name }

    after(:build) do |lesson|
      course = FactoryBot.create :course

      lesson.course_id = course.id
    end
  end
end
