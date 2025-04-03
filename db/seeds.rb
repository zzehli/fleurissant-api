# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# 20.times do |i|
#     Product.create(name: "Plants #{i}", price: "#{i*4.2}")
#   end

# Directory containing the images
image_directory = Rails.root.join('external', 'images')
json_file_path = Rails.root.join('external', 'data.json')

# Ensure the directory exists
unless Dir.exist?(image_directory)
  puts "Image directory not found: #{image_directory}"
  exit
end

unless File.exist?(json_file_path)
  puts "Json directory not found: #{json_file_path}"
  exit
end

products_data = JSON.parse(File.read(json_file_path))

# product_names = products_data.map { |product_data| product_data['name'] }
# duplicate_names = product_names.select { |name| product_names.count(name) > 1 }.uniq

# if duplicate_names.any?
#   puts "Duplicate product names found in JSON file:"
#   duplicate_names.each { |name| puts "- #{name}" }
#   exit
# end

# invalid_prices = products_data.select { |product_data| !product_data['price'].is_a?(Numeric) }

# if invalid_prices.any?
#   puts "Invalid price values found in JSON file:"
#   invalid_prices.each do |product_data|
#     puts "- Product: #{product_data['name'] || 'Unnamed'}, Price: #{product_data['price'].inspect}"
#   end
#   exit
# end

# Seed products with attached images
products_data.each do |product_data|
  product = Product.create!(
    name: product_data['name'],
    price: product_data['price'],
    description: product_data['description'],
    category: product_data['category'],
    quantity: 0
  )

  # Attach the image based on the 'code' field
  image_path = image_directory.join("#{product_data['code']}.jpg")
  if File.exist?(image_path)
    product.image.attach(
      io: File.open(image_path),
      filename: "#{product_data['code']}.jpg",
      content_type: 'image/jpeg'
    )
  else
    puts "Image not found for product code: #{product_data['code']}"
  end
end

puts "========Product seeding complete."
