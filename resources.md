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
* `openssl s_client -connect web.site:433`
* temporary solution: seed data with `kamal app exec --primary -i './bin/rails db:seed'`
* rate limit rails: https://blog.saeloun.com/2024/04/01/rails-7-2-adds-rate-limiting-to-action-controller/
* go to rails console: `kamal app exec -i 'bin/rails console'` or db `kamal app exec -i 'bin/rails db'`
# detailed to 
- [ ] error handling on controller
- [ ] customer checkout backend route
- [x] figure out cors in deployment: https://github.com/cyu/rack-cors
- [x] add a category to the product
- [ ] logout error
- [ ] cart add based on stock
- [ ] refactor stock and proper error handling cart frontend

## Dev Notes
- Run dev env with: `./bin/dev`
- Clear cache: `bin/rails tmp:clear`
## TODO
- [ ] stripe route to REST
- [ ] customer role setup
- [ ] cart persistence