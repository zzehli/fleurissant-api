class Product < ApplicationRecord
  has_one_attached :image do |attachable|
    attachable.variant :card, resize_and_pad: [ 500, 600 ]
  end

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :image, presence: true

  has_many :stocks
  has_many :order_products

  # def image_url
  #   image.url
  # end
end
