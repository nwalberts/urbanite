FactoryGirl.define do
  factory :location do
    sequence(:name) { |n| "Boston #{n}" }
    state "MA"
    description "Best city in the world."
  end
end
