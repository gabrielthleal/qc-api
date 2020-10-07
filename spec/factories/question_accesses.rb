FactoryBot.define do
  factory :question_access do
    question { create(:question) }
    date { Time.current }
    times_accessed { Faker::Number.number(digits: 5) }
  end
end
