class Product < ApplicationRecord
  has_one_attached :image # add image attachment to model
end
