require 'faker'
require 'factory_bot_rails'

FactoryBot.define do
  factory :course do
    course_name { Faker::ProgrammingLanguage.name }
    quantity_registered { Faker::Number.number(2) }
    created_at { Faker::Time.between(1.days.ago, Date.today, :all) }

    after(:build) do |course|
      subject = FactoryBot.create :subject
      user = FactoryBot.create :user

      course.subject_id = subject.id
      course.user_id = user.id
    end
  end
end
