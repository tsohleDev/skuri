class UsersController < ApplicationController

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
    @user = current_user
  end

  # post /users/1/orders
  def orders
    @user = current_user
    @orders = @user.orders

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace("user-content", partial: "users/orders") }
    end
  end

  # post /users/1/returns
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
    @orders = @orders.select { |order| order.order_products.any? { |order_product| order_product.status unless ["complete"].include?(order_product.status) } }

    @order = Order.find(params[:id])
    @products = @order.order_products.select { |order_product| order_product.status unless ["complete"].include?(order_product.status) }
    authorize! :manage, @order

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace("user-content", partial: "users/returns/returns_and_exchanges", locals: { orders: @orders, selected: true }), 
        turbo_stream: turbo_stream.replace("returnables", partial: "users/returns/returnables", locals: { products: @products }) }
    end
  end

  # post /users/1/return
  def return
   @order = Order.find(params[:id])
    @product = OrderProduct.find(params[:item_id])
    authorize! :manage, @order

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
    @product = Product.find(@order_product.product_id)
    authorize! :manage, @order

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
        format.turbo_stream { render turbo_stream: turbo_stream.replace("user-content", partial: "users/returns/returns_and_exchanges", locals: { orders: @orders, selected: true }), 
          turbo_stream: turbo_stream.replace("returnables", partial: "users/returns/returnables", locals: { products: @products }),
          turbo_stream: turbo_stream.replace("exchange", partial: "users/returns/exchange", locals: { product: @product, item: @order_product }) }
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
    authorize! :manage, @order

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
    cart = Cart.find_by(user_id: current_user.id)

    # create order
    order = Order.new
    order.user_id = current_user.id
    order.cost = cart.total_price
    order.address1 = current_user.address1
    order.address2 = current_user.address2
    order.city = current_user.city
    order.state = current_user.state
    order.postal_code = current_user.postal_code
    order.country = current_user.country

    # call the save method to save the order
    if order.save
      cart_products = CartProduct.where(cart_id: cart.id)
      cart_products.each do |cart_product|
        order_product = OrderProduct.new
        order_product.order_id = order.id
        order_product.status = "paid"
        order_product.product_color_id = cart_product.product_color_id
        order_product.quantity = cart_product.quantity
      
        if order_product.save
          puts "success"
        else
          puts "failed"
          puts order_product.errors.full_messages
          puts order_product.inspect
        end
      end

      cart_products.destroy_all
    end

    #puts "success"
    redirect_to user_url(current_user)
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :gender, :date_of_birth, :email, :phone, :address1, :address2, :city, :state, :postal_code, :country, :password, :password_confirmation)
    end
end
