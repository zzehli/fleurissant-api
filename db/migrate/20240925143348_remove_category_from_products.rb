class RemoveCategoryFromProducts < ActiveRecord::Migration[7.2]
  def change
    remove_reference :products, :category, foreign_key: true
  end
end
