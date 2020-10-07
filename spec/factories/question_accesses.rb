FactoryBot.define do
  factory :question_access do
    question { create(:question) }
    date { Date.today }
    times_accessed { Faker::Number.number(digits: 5) }
  end
end
