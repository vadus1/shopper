class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])

    add_breadcrumb "Магазин", root_path
    #add_breadcrumb @product.category.try(:name), category_products_path(@product.category)
    add_breadcrumb @product.name, product_path(@product)
  end
end
