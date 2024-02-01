class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products or /products.json
  def index
    @products = Product.all
    @categories = Category.all
    @user = current_user

    hash = {
      "accessories" => 1,
      "hair" => 2,
      "medication" => 3,
      "shoes" => 4}
    
    if params[:category].nil?
      @products = Product.all
      @category = Category.first
    else
      puts "HERE"
      id = hash[params[:category]]
      puts "ID: #{id}"
      @category = Category.find(hash[params[:category]])
      puts @category.id
      @products =  Product.where(category_id: @category.id)
    end

    puts "PARAMS: #{params[:category]}"
  end

  # GET /products/1 or /products/1.json
  def show
    @product = Product.find_by(id: params[:id])
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    category = Category.find_by(name: params[:product][:category])
    @product = Product.new(name: params[:product][:name], description: params[:product][:description], price: params[:product][:price], stock: params[:product][:stock], image: params[:product][:image], color: params[:product][:color], dimensions: params[:product][:dimensions], category: category)
    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :description, :price, :stock, :image, :color, :dimensions, :category)
    end
end
