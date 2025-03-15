class ProductsController < ApplicationController
  def index
    @products = Product.all
    render json: set_products_json(@products)
  end

  def show
    @product = Product.find(params[:id])
    render json: set_product_json(@product)
  end
end
