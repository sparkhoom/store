FactoryGirl.define do
  factory :user do
    name { Faker::Internet.name }
    email { Faker::Internet.email }
    password "12345678"
    password_confirmation "12345678"
    confirmed_at Time.now

    phone_number { Faker::Internet.name }
  end

  
end