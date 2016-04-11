FactoryGirl.define do
  factory :review do
    rating "5"
    sequence(:body)  { |n| "#{n}This is a wicked good review for the city of Boston!"}
  end
end
