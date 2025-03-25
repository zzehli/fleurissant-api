* getting started with factory_bot: https://github.com/thoughtbot/factory_bot/blob/master/GETTING_STARTED.md 
* api versioning: https://www.honeybadger.io/blog/rails-api-versioning/
* default routing: https://guides.rubyonrails.org/routing.html#resource-routing-the-rails-default
* devise jwt: https://dakotaleemartinez.com/tutorials/devise-jwt-api-only-mode-for-authentication/
* insert data to db:
    ```
    plants(dev)* (1..10).each do |i|
    plants(dev)*   category = Category.find_or_create_by(name: "Category #{i}")
    plants(dev)*   Product.create!(name: "Product #{i}", description: "test description", price: i, category: category)
    plants(dev)> end
    ```
    see: https://guides.rubyonrails.org/active_record_querying.html
* seed data thru `db/seeds.rb`: write seeding code in the file and run `rails db:seed`
* migrations: https://guides.rubyonrails.org/active_record_migrations.html#changing-existing-migrations
* Active Storage: for manage file uploads to cloud storage: https://guides.rubyonrails.org/active_storage_overview.html
* interact with db with Active Record query: https://guides.rubyonrails.org/active_record_querying.html
* routing (including `_path` helper): https://guides.rubyonrails.org/routing.html#path-and-url-helpers
* url_for https://guides.rubyonrails.org/routing.html
* role-based auth: https://developer.auth0.com/resources/guides/api/rails/basic-authorization#validate-a-json-web-token-jwt-in-rails
* change secrete `EDITOR="vim" rails credentials:edit --environment=production`
# detailed to 
- [ ] error handling on controller
- [ ] customer checkout backend route