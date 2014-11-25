FactoryGirl.define do
  factory :product do
    title { Faker::Product.product_name }
    published false
  end
end
