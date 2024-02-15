class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products or /products.json
  def index
    @products = Product.all
    @categories = Category.all
    @user = current_user

    if params[:category].nil?
      @products = Product.all
      @category = Category.first
    else
      @category = Category.find(params[:category])
      puts @category.id
      @products =  Product.joins(:categories).where(categories: {id: @category.id})
    end

    puts "PARAMS: #{params[:category]}"
  end

  # GET /products/1 or /products/1.json
  def show
    # Initialize variables for the product color and size that will be added to the cart
    @product_size = ProductSize.find_by(product_id: params[:id])
    @product_color = ProductColor.find_by(product_size_id: @product_size.id)

    # colors and sizes for the product that are available
    @product_sizes = ProductSize.joins(:product_colors).where(product_id: @product.id)
    @available_sizes = @product_sizes
    @product_colors = ProductColor.where(product_size_id: @product_sizes.ids)
    @available_colors = @product_colors

    # Set the quantity, size, size_uk, and color for the product from the options selected by the user
    @quantity = (params[:quantity] && params[:quantity].to_i > 0) ? params[:quantity].to_i : 1
    @size = params[:size] || nil
    @size_uk = params[:size_uk] || nil
    @color = params[:color] || nil
    @price = @product.price

    # images 
    @image_urls = ProductColorImage.where(product_color_id: @available_colors.first.id).map(&:image_url)
    @image_url = params[:image_index] ? @image_urls[params[:image_index].to_i] : @image_urls.first

    # blur out the sizes and colors that are not available based on the options already selected by the user
    if params[:selected] == 'color'
      @available_sizes = ProductSize.joins(:product_colors).where(product_id: @product.id, product_colors: {color: @color})
      @available_colors = @product_colors
      
      # images when color is selected
      @image_urls = ProductColorImage.where(product_color_id: @available_colors.find_by(color: @color).id).map(&:image_url)
      @image_url = params[:image_index] ? @image_urls[params[:image_index].to_i] : @image_urls.first

      puts '#' * 100
      puts @image_url.inspect

      # if @size is not available for the selected color, set it to nil
      if (@size && !@available_sizes.map(&:size).include?(@size)) || (@size_uk && !@available_sizes.map(&:UK).include?(@size_uk))
        @size = nil
        @size_uk = nil
      end
    elsif params[:selected] == 'size'
      @available_colors = ProductColor.joins(:product_size).where(product_size_id: @product_sizes.ids, product_sizes: {size: @size, UK: @size_uk})
      @available_sizes = @product_sizes

      # if @color is not available for the selected size, set it to nil
      if !@available_colors.map(&:color).include?(@color)
        @color = nil
      end
    end

    # if the user has selected a size and color, update the cart item with the new size and color
    if (@size || @size_uk) && @color
      @product_size = ProductSize.find_by(product_id: @product.id, size: @size, UK: @size_uk)
      @product_color = ProductColor.find_by(product_size_id: @product_size.id, color: @color)
    end
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
      params.require(:product).permit(:name, :description, :price, :stock, :image, :color, :size, :size_uk, :quantity)
    end
end
