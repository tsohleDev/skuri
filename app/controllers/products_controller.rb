class ProductsController < ApplicationController
  def index
    @category = params[:category] ? Category.find(params[:category_id]) : Category.first
  end

  def show
    @product = Product.find(params[:id])
    @product_stock = ProductColourSize.where(product_id: @product.id)
    @selected = @product_stock.first
  end
end
