FactoryBot.define do
  factory :video do
    name_video { Faker::Name.name  }
    description {Faker::Lorem.paragraph }
  end
end
