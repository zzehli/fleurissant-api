class Stock < ApplicationRecord
  validates :product_id, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }

  belongs_to :product

  after_save :update_product_quantity
  after_destroy :update_product_quantity

  private
  def update_product_quantity
    begin
      product.update_attribute!(:quantity, product.stocks.sum(:amount))
    rescue ActiveRecord::RecordInvalid => e
      puts "Failed to update product quantity: #{e.message}"
      Rails.logger.error "Failed to update product quantity: #{e.message}"
      Rails.logger.error e.backtrace.join("\n")
    end    
  end
end
