# README
## INtro
Run dev env with: `./bin/dev`



## Resources
### DB management:
* insert data to db:
    ```
    plants(dev)* (1..10).each do |i|
    plants(dev)*   category = Category.find_or_create_by(name: "Category #{i}")
    plants(dev)*   Product.create!(name: "Product #{i}", description: "test description", price: i, category: category)
    plants(dev)> end
    ```
    see: https://guides.rubyonrails.org/active_record_querying.html

* migrations: https://guides.rubyonrails.org/active_record_migrations.html#changing-existing-migrations

categories: https://youtu.be/hURUMwdCWuI?si=MPABq1IvY2H4WDnA&t=1441
product: https://youtu.be/hURUMwdCWuI?si=xXLqtEoB0pr1PHsn&t=3349
