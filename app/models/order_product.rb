class OrderProduct < ApplicationRecord
  validates :product_id, presence: true
  validates :order_id, presence: true
  validates :quantity, presence: true, numericality: { greater_than: 0 }

  belongs_to :product
  belongs_to :order
end
