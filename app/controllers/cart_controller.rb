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
      product = ProductColourSize.find_by(product_id: params[:product_id], colour_id: params[:colour_id], size_id: params[:size_id])

      cart_product = CartProduct.new(cart: @cart, product_colour_size: product, quantity: params[:quantity])
      # check if the product is already in the cart
      if CartProduct.where(cart: @cart, product_colour_size: product).exists?
        cart_product = CartProduct.where(cart: @cart, product_colour_size: product).first
        cart_product.quantity = cart_product.quantity + params[:quantity].to_i
  
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

      # els id the product is not in the cart
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

  def increment
    #increment the quantity of the cart product
    @cart = Cart.find(params[:cart_id])
    @cart_product = CartProduct.find(params[:product_id])
    @cart_product.quantity = @cart_product.quantity + 1
    
    if @cart_product.save
      @cart.total_price = @cart.total_price + @cart_product.product_colour_size.price
      @cart.save

      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.replace("quantity-#{params[:product_id]}", partial: 'cart/quantity', locals: { item: @cart_product }),
            turbo_stream.replace('price', partial: 'cart/price', locals: { cart: @cart })
          ]
        end
      end
    else
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.append('alerts', partial: 'shared/alerts', locals: { notice: 'Product not incremented' }) }
      end
    end
  end

  def decrement
    # if the quantity is 1, do not decrement
    if CartProduct.find(params[:product_id]).quantity == 1
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.append('alerts', partial: 'shared/alerts', locals: { notice: 'Product quantity cannot be less than 1' }) }
      end
      return
    end

    #decrement the quantity of the cart produc
    @cart = Cart.find(params[:cart_id])
    @cart_product = CartProduct.find(params[:product_id])
    @cart_product.quantity = @cart_product.quantity - 1
    
    if @cart_product.save
      @cart.total_price = @cart.total_price - @cart_product.product_colour_size.price
      @cart.save

      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.replace("quantity-#{params[:product_id]}", partial: 'cart/quantity', locals: { item: @cart_product }),
            turbo_stream.replace('price', partial: 'cart/price', locals: { cart: @cart })
          ]
        end
      end
    else
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.append('alerts', partial: 'shared/alerts', locals: { notice: 'Product not decremented' }) }
      end
    end
  end

  def remove
    @cart = current_user.cart
    @cart_product = CartProduct.find(params[:id])

    if @cart_product.destroy
      @cart.total_price = @cart.total_price - (@cart_product.product_colour_size.price * @cart_product.quantity)
      @cart.save

      # icrement the quantity of the product
      product = ProductColourSize.find(@cart_product.product_colour_size.id)
      product.quantity = product.quantity + @cart_product.quantity
      product.save


      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.remove("item_#{params[:id]}"),
            turbo_stream.replace('price', partial: 'cart/price', locals: { cart: @cart }),
            turbo_stream.append('alerts', partial: 'shared/alerts', locals: { notice: 'Product removed from cart' })
          ]
        end
      end
    else
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.append('alerts', partial: 'shared/alerts', locals: { notice: 'Product not removed from cart' }) }
      end
    end
  end
end
