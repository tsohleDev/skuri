require 'uri'
require 'net/http'
require 'json'
require 'digest/md5'

class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart, only: %i[show edit update destroy]
  
  def add_to_cart
    @user = current_user
    @cart = Cart.find_by(user_id: current_user.id) || Cart.new(user_id: current_user.id)

    if params[:size_uk].nil?
      @product_size = ProductSize.find_by(product_id: params[:product_id], size: params[:size])
    else
      @product_size = ProductSize.find_by(product_id: params[:product_id], UK: params[:size_uk])
    end

    @product_color = ProductColor.find_by(product_size_id: @product_size.id, color: params[:color])
    @cart_product = CartProduct.find_by(cart_id: @cart.id, product_color_id: @product_color.id)

    if @cart_product.nil?
      @cart_product = CartProduct.new(cart_id: @cart.id, product_color_id: @product_color.id, quantity: params[:quantity])
    else
      @cart_product.quantity += params[:quantity].to_i
    end

    @cart_product.save
    @cart.set_total_price
  end
  
  def remove_from_cart
    @cart = Cart.find_by(user_id: current_user.id)
    @product = ProductColor.find_by(id: params[:id])

    # find and destroy cart item
    @cart_item = CartProduct.find_by(cart_id: @cart.id, product_color_id: @product.id).destroy
    @cart.set_total_price

    # no redirect just notify user
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove("item_#{params[:id]}") }
    end
  end

  def increment_quantity
    # Your logic to increment quantity
    @user = current_user
    @cart = Cart.find_by(user_id: current_user.id)
    @cart_product = CartProduct.find_by(cart_id: @cart.id, product_id: params[:product_id])
    @cart_product.quantity += 1

    @cart_product.save

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace("quantity_#{params[:product_id]}", partial: "carts/quantity", locals: { item: @cart_product }) }
    end
  end

  def decrement_quantity
    @user = current_user
    @cart = Cart.find_by(user_id: current_user.id)
    @cart_product = CartProduct.find_by(cart_id: @cart.id, product_id: params[:product_id])
    @cart_product.quantity -= 1

    @cart_product.save

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace("quantity_#{params[:product_id]}", partial: "carts/quantity", locals: { item: @cart_product }) }
    end
  end

  def checkout
    @user = current_user
    @cart = Cart.find_by(user_id: current_user.id)
    @cart_products = CartProduct.where(cart_id: @cart.id)

    if @cart_products.empty?
      # send error message
      format.html { redirect_to root_path, notice: "Cart is empty, please add items to cart before checking out." }
    end

    @cart_products.each do |cart_product|
      @product = Product.find_by(id: cart_product.product_id)
      @product.stock -= cart_product.quantity
      @product.save
    end

    @cart_products.destroy_all

    # create order
    @order = Order.new
    @order.user_id = current_user.id
    @order.total_price = @cart.total_price
    @order.address1 = @user.address1
    @order.address2 = @user.address2
    @order.city = @user.city
    @order.province = @user.province
    @order.postal_code = @user.postal_code
    #@order.country = @user.country
    @order.save

    puts "#" * 50


    # respond_to do |format|
    #   format.turbo_stream { render turbo_stream: turbo_stream.replace("cart-count", partial: "carts/cart_count", locals: { cart: @cart }),
    #                                           turbo_stream: turbo_stream.replace("cart-modal", partial: "carts/cart_pop_up", locals: { cart: @cart }) } 
  end

  # GET /carts/1 or /carts/1.json
  def show
    @user = current_user
    @cart = Cart.find_by(user_id: current_user.id)  
    #authorize only if cart belongs to current user
    authorize! :read, Cart, user_id: current_user.id

    if @cart.nil?
      @cart = Cart.new
      @cart.user_id = current_user.id

      @cart.set_total_price

      if not @cart.save
        # send error message
        format.html { redirect_to root_path, notice: "Cart was not created, please try again." }
      end
    end

    @cart_products = CartProduct.where(cart_id: @cart.id)
    @products = @cart_products.map { |cart_product| cart_product.product_color }
  end

  # GET /carts/new
  def new
    @cart = Cart.new
    authorize! :create, @cart
  end

  # GET /carts/1/edit
  def edit
    authorize! :update, @cart
  end

  # POST /carts or /carts.json
  def create
    @cart = Cart.new(cart_params)
    authorize! :create, @cart

    respond_to do |format|
      if @cart.save
        format.html { redirect_to cart_url(@cart), notice: "Cart was successfully created." }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1 or /carts/1.json
  def update
    authorize! :update, @cart

    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to cart_url(@cart), notice: "Cart was successfully updated." }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1 or /carts/1.json
  def destroy
    @cart.destroy
    authorize! :destroy, @cart

    respond_to do |format|
      format.html { redirect_to carts_url, notice: "Cart was successfully destroyed." }
      format.json { head :no_content }
    end
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_cart
    @cart = Cart.find_by(user_id: current_user.id)
  end

  # Only allow a list of trusted parameters through.
  def cart_params
    params.require(:cart).permit(:product_id, :quantity, :user_id)
  end

  # Only allow a list of trusted parameters through.
  def submit_to_payfast
      
    puts "checkout"
    puts "#" * 50
    my_data = {
      'merchant_id' => '10000100',
      'merchant_key' => '46f0cd694581a',
      'return_url' => 'http://localhost:3000/users/1',
      'cancel_url' => 'http://localhost:3000/users/1',
      'notify_url' => 'http://localhost:3000/users/1',
      'name_first' => 'First Name',
      'name_last' => 'Last Name',
      'email_address' => 'test@test.com',
      'm_payment_id' => '1234',
      'amount' => '100.00',
      'item_name' => 'Test Product',
    }

    def data_to_string(data_array, pass_phrase = '')
      pf_param_string = ''
      data_array.each do |key, value|
        # Get all the data from Payfast and prepare parameter string
        pf_param_string += "#{key}=#{URI.encode_www_form_component(value).gsub('+', ' ')}&"
      end
      # After looping through, cut the last & or append your passphrase
      pf_param_string = pf_param_string[0..-2]
      pf_param_string += "&passphrase=#{pass_phrase}" unless pass_phrase.empty?
      pf_param_string
    end

    def generate_payment_identifier(pf_param_string)
      url = URI.parse("https://sandbox.payfast.co.za/onsite/process")
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = (url.scheme == 'https')
      
      headers = { 'Content-Type' => 'application/x-www-form-urlencoded' }
      response = http.post(url.path, pf_param_string, headers)
      
      begin
        response_json = JSON.parse(response.body)
        uuid = response_json['uuid']
        uuid
      rescue
        false
      end
    end

    def generate_signature(data_array, pass_phrase = '')
      payload = data_to_string(data_array, pass_phrase)
      Digest::MD5.hexdigest(payload)
    end

    # Generate signature
    pass_phrase = 'jt7NOE43FZPn'
    my_data['signature'] = generate_signature(my_data, pass_phrase)

    # Convert the data array to a string
    pf_param_string = data_to_string(my_data, pass_phrase)

    # Generate payment identifier
    identifier = generate_payment_identifier(pf_param_string)
    puts identifier
  end
end
