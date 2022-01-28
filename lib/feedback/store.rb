#frozen_string_literal: true

class Store
  include Singleton

  @@store = {cart: [], rated_products: []}

  def save_cart(cart)
    @@store[:cart] = cart
  end

  def save_rated_product(product)
    @@store[:rated_products] << product
  end

  def fetch(key)
    @@store[key]
  end

  def fetch_products_names_hash
    @@store[:cart].map.with_index(0){ |product, index| {product.name => index} }
  end

  def blank?
    @@store[:cart].count == 0
  end
end
