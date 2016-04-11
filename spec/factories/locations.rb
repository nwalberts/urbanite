FactoryGirl.define do
  factory :location do
    user_id "1"
    sequence(:name) { |n| "Boston #{n}" }
    state "MA"
    description "Best city in the world."
  end
end
