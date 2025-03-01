FactoryBot.define do
    puts "define a product"
    factory :product do
        sequence(:name){ |n| "product#{n}" }
        sequence(:price) { |n| n}
    end
end