FactoryBot.define do
  factory :question do
    statement { Faker::Lorem.sentence }
    text { Faker::Lorem.paragraph }
    answer { %w[A B C D E].sample }
    daily_access { Faker::Number.number(digits: 3) }
    discipline { Faker::Educator.course_name }

    trait :with_access do
      after :create do |question|
        create(:question_access, question_id: question.id)
      end
    end
  end
end
