FactoryGirl.define do
  factory :review do
    rating "5"
    body "This is a wicked good review for the city of Boston!"

    user
    location
  end
end
