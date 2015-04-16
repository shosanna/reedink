FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "olaf#{n}@gmail.com" }
    password "Olaf12345"
  end
end
