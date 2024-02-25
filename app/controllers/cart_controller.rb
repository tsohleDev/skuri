class CartController < ApplicationController
  def index
    @cart = current_user.cart || Cart.create(user: current_user)
    @cart_products = CartProduct.where(cart: @cart)
  end

  def add
    if current_user.nil?
      redirect_to new_user_session_path
      return
    end

    @cart = current_user.cart || Cart.create(user: current_user)
    if params[:colour_id].present? && params[:size_id].present?
      product = ProductColourSize.find_by(product_id: params[:product_id])

      cart_product = CartProduct.new(cart: @cart, product_colour_size: product, quantity: params[:quantity])
      if cart_product.save
        @cart.total_price = @cart.total_price + (product.price * params[:quantity].to_i)
        @cart.save

        respond_to do |format|
          format.turbo_stream { render turbo_stream: turbo_stream.append('notice', partial: 'shared/alerts', locals: { notice: 'Product added to cart' }) }
        end
      else
        puts '#'*100
        puts cart_product.errors.full_messages
        respond_to do |format|
          format.turbo_stream { render turbo_stream: turbo_stream.append('notice', partial: 'shared/alerts', locals: { notice: 'Product not added to cart' }) }
        end
      end
    end
  end

  def remove
    @cart = current_user.cart
    product = CartProduct.find(params[:id])
    @cart.total_price = @cart.total_price - (product.price * product.quantity)
    @cart.save
    product.destroy
    redirect_to cart_index_path
  end
end
