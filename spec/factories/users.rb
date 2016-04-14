FactoryGirl.define do
  factory :user do
    first_name "Charlize"
    last_name "Theron"
    home_location "The Green Place"
    sequence(:email) { |n| "imperatorfuriosa#{n}@madmax.com" }
    password "password"
  end
end
