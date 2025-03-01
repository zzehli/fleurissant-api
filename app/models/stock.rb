class Stock < ApplicationRecord
  validates :product_id, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
  
  belongs_to :product
end
