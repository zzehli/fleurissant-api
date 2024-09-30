class RemoveSizeFromStocks < ActiveRecord::Migration[7.2]
  def change
    remove_column :stocks, :size, :string
  end
end
