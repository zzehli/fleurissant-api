class ApplicationController < ActionController::API
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  # allow_browser versions: :modern
  # before_action :set_active_storage_current_host
  include ActionController::MimeResponds

  # def set_active_storage_current_host
  #   ActiveStorage::Current.url_options = {
  #     protocol: request.protocol,
  #     host: request.host,
  #     port: request.port
  #   }
  # end
  def set_product_json(product)
    product.as_json.merge(image_url: product.image_url)
  end
  def set_products_json(products)
    products.map { |product| set_product_json(product) }
  end
end
