class WebhooksController < ApplicationController
  # skip_forgery_protection

  def stripe
    stripe_secret_key = Rails.application.credentials.dig(:stripe, :secret_key)
    Stripe.api_key = stripe_secret_key
    payload = request.body.read
    endpoint_secret = Rails.application.credentials.dig(:stripe, :webhook_secret)
    event = nil

    begin
      event = Stripe::Event.construct_from(
        JSON.parse(payload, symbolize_names: true)
      )
    rescue JSON::ParserError => e
      # Invalid payload
      puts "⚠️  Webhook error while parsing basic request. #{e.message}"
      status 400
      return
    end

    if endpoint_secret
      # Retrieve the event by verifying the signature using the raw body and secret.
      signature = request.env["HTTP_STRIPE_SIGNATURE"]
      begin
        event = Stripe::Webhook.construct_event(
          payload, signature, endpoint_secret
        )
      rescue Stripe::SignatureVerificationError => e
        puts "⚠️  Webhook signature verification failed. #{e.message}"
        status 400
      end
    end

    case event.type
    when "checkout.session.completed"
      session = event.data.object
      shipping_details = session["shipping_details"]
      puts "Session: #{session}"
      if shipping_details
        address = "#{shipping_details['address']['line1']} #{shipping_details['address']['city']}, #{shipping_details['address']['state']} #{shipping_details["address"]["postal_code"]}"
      else
        address = ""
      end
      order = Order.create!(customer_email: session["customer_details"]["email"], total: session["amount_total"]/100, address: address, fulfilled: false)
      full_session = Stripe::Checkout::Session.retrieve({
        id: session.id,
        expand: [ "line_items" ]
      })
      line_items = full_session.line_items
      line_items["data"].each do |item|
        product = Stripe::Product.retrieve(item["price"]["product"])
        product_id = product["metadata"]["product_id"].to_i
        OrderProduct.create!(order: order, product_id: product_id, quantity: item["quantity"])
        Stock.find(product["metadata"]["product_stock_id"]).decrement!(:amount, item["quantity"])
      end
    else
      puts "Unhandled event type: #{event.type}"
    end

    render json: { message: "success" }
  end
end
