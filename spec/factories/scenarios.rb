FactoryBot.define do
  factory :scenario do
        title {Faker::Books::Lovecraft.words}
        scenario {Faker::Books::Lovecraft.paragraphs}
        association :user

        after(:build) do |scenario|
          scenario.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
        end
  end
end
