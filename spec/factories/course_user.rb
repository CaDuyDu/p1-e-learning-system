require 'faker'
require 'factory_bot_rails'

FactoryBot.define do
  factory :course_user do
    status { Faker::Name.Number.between(1, 2) }
    debit { Faker::Number.decimal_part(10) }
    created_at { Faker::Time.between(1.days.ago, Date.today, :all) }

    after(:build) do |course_user|
      subject = FactoryBot.create :subject
      user = FactoryBot.create :user

      course_user.course_id = course.id
      course_user.user_id = user.id
    end
  end
end
