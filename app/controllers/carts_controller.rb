class CartsController < ApplicationController
  before_action :set_cart, only: %i[ show edit update destroy ]

  # GET /carts or /carts.json
  def index
    @user = current_user
    @carts = Cart.all
  end

  def add_to_cart
    puts "add_to_cart"
    @cart = Cart.find_by(user_id: current_user.id)
    @product = Product.find_by(id: params[:id])

    # check if product is already in cart
    @cart_item = CartProduct.find_by(cart_id: @cart.id, product_id: @product.id)

    if @cart_item.nil?  
      @cart_item = CartProduct.new
      @cart_item.cart_id = @cart.id
      @cart_item.product_id = @product.id
      @cart_item.quantity = 1
    else
      @cart_item.quantity += 1
    end

    if @cart_item.save 
      puts "saved"
    else
      puts "not saved"
    end
    
    # no redirect just notify user
    # format.json { render :show, status: :created, location: @cart }
  end

  def remove_from_cart
    puts "remove_from_cart"
    @cart = Cart.find_by(user_id: current_user.id)
    @product = Product.find_by(id: params[:id])

    # find and destroy cart item
    @cart_item = CartProduct.find_by(cart_id: @cart.id, product_id: @product.id).destroy

    # no redirect just notify user
    # format.json { render :show, status: :created, location: @cart }
  end

  # GET /carts/1 or /carts/1.json
  def show
    @cart = Cart.find_by(user_id: current_user.id)  
    authorize! :read, @cart

    if @cart.nil?
      @cart = Cart.new
      @cart.user_id = current_user.id

      @cart.total_price = @cart.products.sum(:price)

      if not @cart.save
        # send error message
        format.html { redirect_to root_path, notice: "Cart was not created, please try again." }
      end
    end

    @cart_products = CartProduct.where(cart_id: @cart.id)
    @products = @cart_products.map { |cart_product| cart_product.product }
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts or /carts.json
  def create
    @cart = Cart.new(cart_params)

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
end
