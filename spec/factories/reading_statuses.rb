FactoryGirl.define do
  factory :reading_status do
    association :user
    association :book
    last_progress_at { Time.zone.now }
  end
end
