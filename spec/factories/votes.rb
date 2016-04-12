FactoryGirl.define do
  factory :vote do
    value "1"

    user
    review
  end
end
