FactoryBot.define do
    factory :product do
        name { Faker::Commerce.product_name }
        sequence(:price) { |n| n }
    end
end
