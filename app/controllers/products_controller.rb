class ProductsController < ApplicationController
  def index
    @products = Product.all
    render json: @products.map { |product| product.as_json.merge(image_url: product.image_url) }
  end

  def show
    @product = Product.find(params[:id])
    render json: @product.as_json.merge(image_url: @product.image_url)
  end
end
