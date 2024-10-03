class CheckoutController < ApplicationController
  def create
    stripe_secret_key = Rails.application.credentials.dig(:stripe, :secret_key)
    Stripe.api_key = stripe_secret_key
    cart = params[:cart]
    line_items = cart.map do |i|
      product = Product.find(i["id"])
      product_stock = product.stocks.first

      if product_stock.amount < i["quantity"].to_i
        render json: {
          error: "Not enough stock for #{product.name}.",
          status: 400
        }
        return
      end

      {
        quantity: i["quantity"].to_i,
        price_data: {
          product_data: {
            name: i["name"],
            metadata: {
              product_id: product.id,
              product_stock_id: product_stock.id
            }
          },
          currency: "cad",
          unit_amount: i["price"].to_i * 100
        }
      }
    end
    puts line_items
    session = Stripe::Checkout::Session.create(
      mode: "payment",
      line_items: line_items,
      success_url: "https://mysite-i60f.onrender.com/checkout/success",
      cancel_url: "https://mysite-i60f.onrender.com/checkout/cancel",
      shipping_address_collection: {
        allowed_countries: [ "CA" ]
      }
    )

    render json: { url: session.url }
  end

  def success
    # probably not the best practice since this page should fetch the data from
    # webhook directly and inaccessible except when payment is successful
    @order = Order.last
  end

  def cancel
    render :cancel
  end
end
