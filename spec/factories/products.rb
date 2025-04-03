FactoryBot.define do
    factory :product do
        name { Faker::Commerce.product_name }
        sequence(:price) { |n| n }
        image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'files', 'test.avif'), 'image/avif') }
        category { [ "shrubs", "house plants" ].sample }
    end
end
