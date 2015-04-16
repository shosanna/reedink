FactoryGirl.define do
  factory :book do
    title "Harry Potter"
    author "J.K.Rowling"
    page_count 350
    url "pottermore.com"
    association :user
  end

end
