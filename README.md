# README
Fleurissant is an online floral boutique. The shop is a rails app that supports admin and regular customer user types. As a shop owner, one can manage inventory (create, update, remove products), and orders (update, remove). As a customer, one can shop and pay for the plants.

## Intro
Run dev env with: `./bin/dev`

## Resources
* insert data to db:
    ```
    plants(dev)* (1..10).each do |i|
    plants(dev)*   category = Category.find_or_create_by(name: "Category #{i}")
    plants(dev)*   Product.create!(name: "Product #{i}", description: "test description", price: i, category: category)
    plants(dev)> end
    ```
    see: https://guides.rubyonrails.org/active_record_querying.html

* migrations: https://guides.rubyonrails.org/active_record_migrations.html#changing-existing-migrations
* Active Storage: for manage file uploads to cloud storage: https://guides.rubyonrails.org/active_storage_overview.html
* interact with db with Active Record query: https://guides.rubyonrails.org/active_record_querying.html
* routing (including `_path` helper): https://guides.rubyonrails.org/routing.html#path-and-url-helpers

## Backlog
- [ ] redo application page layout, move navbar to a new layer
- [x] admin/products/:id/edit "update" button routing
- [ ] active storage setup: https://youtu.be/hURUMwdCWuI?si=daU6GO7F8dYTc-P8&t=2697
- [ ] crop images when upload
- [ ] cart customer side
- [ ] payment
- [ ] deploy