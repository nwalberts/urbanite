FactoryGirl.define do
  factory :user do
    id "1"
    first_name "Charlize"
    last_name "Theron"
    home_location "The Green Place"
    sequence(:email) { |n| "imperatorfuriosa#{n}@madmax.com" }
    password "password"
  end

  factory :admin do
    id "2"
    first_name "Charlize"
    last_name "Theron"
    home_location "The Green Place"
    sequence(:email) { |n| "admin#{n}@admin.com" }
    password "password"
    role "admin"
  end
end
