require 'faker'
require 'factory_bot_rails'

FactoryBot.define do
  factory :homework do
    name_homework { Faker::ProgrammingLanguage.name }
    total_exercise { Faker::Number.number(2) }
    lesson_number { Faker::Number.number(2) }
    created_at { Faker::Time.between(1.days.ago, Date.today, :all) }

    after(:build) do |homework|
      lesson = FactoryBot.create :lesson

      homework.lesson_id = lesson.id
    end
  end
end
