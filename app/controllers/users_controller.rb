class UsersController < ApplicationController
  def show
    #user must be logged in to view their profile
    if current_user == nil
      redirect_to new_user_session_path 
    end
    @user = User.find(params[:id])
  end

  def orders
    puts "orders"
    @user = current_user
    @orders = @user.orders

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace("user-content", partial: "users/orders") }
    end
  end

  def returns
    @user = current_user
    @orders = @user.orders.includes(:order_products)
    # filter orders by status
    @orders = @orders.select { |order| order.user_id == @user.id }
    @orders = @orders.select { |order| order.created_at > 14.days.ago }
    #@orders = @orders.select { |order| order.order_products.any? { |order_product| order_product.status unless ["ret"].include?(order_product.status) } }

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace("user-content", partial: "users/returns/returns_and_exchanges", locals: { orders: @orders, selected: false}) }
    end
  end

    # post /users/1/returnables
  def returnables
    @user = current_user
    @orders = @user.orders.includes(:order_products)
    # filter orders by status
    @orders = @orders.select { |order| order.user_id == @user.id }
    @orders = @orders.select { |order| order.created_at > 14.days.ago }
    #@orders = @orders.select { |order| order.order_products.any? { |order_product| order_product.status unless ["complete"].include?(order_product.status) } }

    @order = Order.find(params[:id])
    @products = @order.order_products #select { |order_product| order_product.status unless ["complete"].include?(order_product.status) }
    #authorize! :manage, @order

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace("user-content", partial: "users/returns/returns_and_exchanges", locals: { orders: @orders, selected: true }), 
        turbo_stream: turbo_stream.replace("returnables", partial: "users/returns/returnables", locals: { products: @products }) }
    end
  end

  # post /users/1/return
  def return
   @order = Order.find(params[:id])
    @product = OrderProduct.find(params[:item_id])
    #authorize! :manage, @order

    # Update the order product status
    @product.update(status: 'returned')

    # asserts for the view
    @user = current_user
    @orders = @user.orders.includes(:order_products) 
    # filter orders by status
    @orders = @orders.select { |order| order.user_id == @user.id }
    @orders = @orders.select { |order| order.created_at > 14.days.ago }
    @orders = @orders.select { |order| order.order_products.any? { |order_product| order_product.status unless ["returned", "exchanged"].include?(order_product.status) } }

    @order = Order.find(params[:id])
    @products = @order.order_products.select { |order_product| order_product.status unless ["complete"].include?(order_product.status) }

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace("user-content", partial: "users/returns/returns_and_exchanges", locals: { orders: @orders, selected: true }), 
        turbo_stream: turbo_stream.replace("returnables", partial: "users/returns/returnables", locals: { products: @products }) }
    end
  end

  # post /users/1/exchange
  def exchange
    @order = Order.find(params[:id])
    @order_product = OrderProduct.find(params[:item_id])
    @product = @order_product.product
    #authorize! :manage, @order

    puts '#' * 100
    puts params.inspect

    # Update the order product status
    if params[:size]
      @order_product.update(status: 'exchanged', exchange_size: params[:size])
      puts @order_product.inspect
    end

    # asserts for the view
    @user = current_user
    @orders = @user.orders.includes(:order_products) 
    # filter orders by status
    @orders = @orders.select { |order| order.user_id == @user.id }
    @orders = @orders.select { |order| order.created_at > 14.days.ago }
    @orders = @orders.select { |order| order.order_products.any? { |order_product| order_product.status unless ["complete"].include?(order_product.status) } }

    @order = Order.find(params[:id])
    @products = @order.order_products.select { |order_product| order_product.status unless ["complete"].include?(order_product.status) }

    if params[:size]
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace("user-content", partial: "users/returns/returns_and_exchanges", locals: { orders: @orders, selected: true }), 
          turbo_stream: turbo_stream.replace("returnables", partial: "users/returns/returnables", locals: { products: @products }) }
      end
    else
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace("exchange", partial: "users/returns/exchange", locals: { item: @order_product, product: Product.find(@order_product.product_id) }) }
      end
    end

  end

  def cancel
    @order = Order.find(params[:id])
    @order_product = OrderProduct.find(params[:item_id])

    # Update the order product status
    @order_product.update(status: 'paid')

    # asserts for the view
    @user = current_user
    @orders = @user.orders.includes(:order_products)
    # filter orders by status
    @orders = @orders.select { |order| order.user_id == @user.id }
    @orders = @orders.select { |order| order.created_at > 14.days.ago }
    @orders = @orders.select { |order| order.order_products.any? { |order_product| order_product.status unless ["complete"].include?(order_product.status) } }

    @order = Order.find(params[:id])
    @products = @order.order_products.select { |order_product| order_product.status unless ["complete"].include?(order_product.status) }
    #authorize! :manage, @order

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace("user-content", partial: "users/returns/returns_and_exchanges", locals: { orders: @orders, selected: true }), 
        turbo_stream: turbo_stream.replace("returnables", partial: "users/returns/returnables", locals: { products: @products }) }
    end
  end

  def help
    @user = current_user

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace("user-content", partial: "users/help") }
    end
  end


  def success
    user = User.find(params[:id])
    cart = Cart.find_by(user: user)

    order = Order.new
    order.user = user
    order.adress = Adress.new(apartment: "1", suburb: "1", city: "1", province: "1", country: "1", postal_code: "1")
    order.cost = cart.total_price
  
    if order.save
      cart.cart_products.each do |cart_item|
        order_item = OrderProduct.new
        order_item.order = order
        order_item.product_flavour_id = cart_item.product_flavour_id
        order_item.product_colour_size_id = cart_item.product_colour_size_id
        order_item.quantity = cart_item.quantity
        order_item.save

        # reduce quantity based on whether the product is a product_colour_size_id exists or product_flavour_id
        if cart_item.product_colour_size_id
          product_colour_size = ProductColourSize.find(cart_item.product_colour_size_id)
          product_colour_size.quantity -= cart_item.quantity
          product_colour_size.save
        else
          product_flavour = ProductFlavour.find(cart_item.product_flavour_id)
          product_flavour.quantity -= cart_item.quantity
          product_flavour.save
        end
      end

      cart.destroy

      respond_to do |format|
        format.html { redirect_to user_path(user), notice: "Order created successfully" }
      end
    else
      redirect_to user_path(user), alert: order.errors.full_messages.join(", ")
    end
  end

  private
  def user_params 
    params.require(:user).permit(:first_name, :last_name, :email, :gender, :phone, :password, :password_confirmation)
  end

  def adress_params
    params.require(:adress).permit(:apartment, :suburb, :city, :province, :country, :postal_code)
  end
end
