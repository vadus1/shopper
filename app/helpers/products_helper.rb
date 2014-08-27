module ProductsHelper
  def product_added_for product_id
    cart_order ||= current_order.products.include?(product_id)
  end

  def add_cart_for product
    product_added_for(product.id) ? current_order.items.where(product_id: product.id).first : [product, product.items.build]
  end
end
