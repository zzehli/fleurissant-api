class ProductsController < ApplicationController
  before_action :sanitize_pagination_params, only: %i[ index ]
  def index
    @products = Product.where(category: "indoor plants").page(params[:page], params[:limit])
    render json: set_products_json(@products)
  end

  def show
    @product = Product.find(params[:id])
    render json: set_product_json(@product)
  end
end
