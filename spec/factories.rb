FactoryGirl.define do
  factory :user do
    name "user1"
    email "user1@example.com"
    password "123123"
    password_confirmation "123123"
    confirmed_at Time.now
  end

  
end