class ProductsController < ApplicationController
  def index
    if params[:category].blank?
      @category = Category.find_by(name: "All")
      @products = Product.all.order("created_at DESC")
    else
      @category = Category.find_by(name: params[:category])
      @products = @category.products
    end
  end

  def show
    @product = Product.find(params[:id])
    @product_stock = ProductColourSize.where(product_id: @product.id)
    @selected = @product_stock.first
  end

  def search
    if params[:query].nil? || params[:query].strip.empty?
      @results_products = []
    else
      @results_products = Product.ransack(name_cont: params[:query]).result(distinct: true)
    end
    puts "results_products: #{@results_products.inspect}"

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace('results', partial: 'products/results') }
    end
  end

  def change_colour
    puts "params: #{params.inspect}"
    @product = Product.find(params[:id])
    @selected = ProductColourSize.find_by(product_id: @product.id, colour: Colour.find_by(name: params[:colour]))

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.replace('side-images', partial: 'products/show/side_images'),
          turbo_stream.replace('main-image', partial: 'products/show/main_image', locals: { image: @selected.image }),
          turbo_stream.replace('cart-colour', partial: 'products/show/information/colour_field', locals: { cart: true }),
          turbo_stream.replace('wishlist-colour', partial: 'products/show/information/colour_field', locals: { cart: false }),
          turbo_stream.replace('colours-sizes', partial: 'products/show/information/colours_sizes' )
        ]
      end
    end
  end

  def review
    # if the user is not signed in
    unless review_params[:user_id] == '0'
      @review = Review.new(review_params)
      
      if @review.save
        redirect_to product_path(@review.product_id)
      else
        puts @review.errors.full_messages
        puts "Review not saved"
      end
    else
      redirect_to new_user_session_path
    end
  end

  private
  def review_params
    # change id to product_id to match the model
    params[:product_id] = params[:id]
    params.permit(:user_id, :product_id, :rating, :message, images: [])
  end
end
