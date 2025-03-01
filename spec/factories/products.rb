FactoryBot.define do
    puts "define a product"
    factory :product do
        name { 'product1' }
        price { 10 }
    end
end