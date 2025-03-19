class AddQuantityToProducts < ActiveRecord::Migration[7.2]
  def change
    add_column :products, :quantity, :integer
  end
end
