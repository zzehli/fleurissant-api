class Order < ApplicationRecord
  validates :customer_email, presence: true
  validates :total, presence: true
  validates :address, presence: true
  validates :fulfilled, presence: true, inclusion: { in: [ true, false ] }
  has_many :order_products
end
