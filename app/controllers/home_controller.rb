class HomeController < ApplicationController
  def index
    @latest_products = Product.take(8)
  end
end
