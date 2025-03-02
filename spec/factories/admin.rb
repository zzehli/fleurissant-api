FactoryBot.define do
    puts "define a admin"
    factory :admin do
        sequence(:email) { |n| "email#{n}@test.com"}
        sequence(:password) { |n| "password#{n}"}
    end
end