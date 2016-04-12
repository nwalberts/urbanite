FactoryGirl.define do
  factory :user do
    id "1"
    first_name "Charlize"
    last_name "Theron"
    home_location "The Green Place"
    sequence(:email) { |n| "imperatorfuriosa#{n}@madmax.com" }
    password "password"
  end
end
