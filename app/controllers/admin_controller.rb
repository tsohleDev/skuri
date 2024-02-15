class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart, only: %i[show edit update destroy]

  def index
    @user = current_user
    @help_messages = HelpMessage.all
    @orders = Order.all.includes(:order_products)
    @products = Product.all
    @users = User.all
    @shipments = Shipment.all

    @orders_data = Order.group_by_hour(:created_at).count
    authorize! :access, :admin
  end

  def products
    @products = Product.all
    authorize! :access, :admin

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace('admin-content', partial: 'admin/products/products', locals: { products: @products }) }
    end
  end

  def orders
    @orders = Order.all.includes(:order_products).order(created_at: :asc)
    authorize! :access, :admin

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace('admin-content', partial: 'admin/orders/orders', locals: { orders: @orders }) }
    end
  end

  def messages
    @help_messages = HelpMessage.all
    authorize! :access, :admin

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace('admin-content', partial: 'admin/messages', locals: { messages: @help_messages }) }
    end
  end

  def categories
    @categories = Category.all
    authorize! :access, :admin

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace('admin-content', partial: 'admin/categories', locals: { categories: @categories }) }
    end
  end

  # NEWs
  def new_product
    @products = Product.all.order(created_at: :desc)
    @categories = Category.all
    @product = Product.new
    authorize! :access, :admin

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace('admin-content', partial: 'admin/products/products', locals: { products: @products }),
        turbo_stream: turbo_stream.replace('product-modal', partial: 'admin/products/edit_product', locals: { product: @product, is_new: true }) }
    end
  end

  def create_product
    puts "PARAMS: #{product_params.inspect}"
    @product = Product.new(product_params)

    puts '#' * 100
    puts params.inspect

    if @product.save
      params[:categories].each do |category|
        @product.categories << Category.find_by(name: category)
      end

      params[:colors].each_with_index do |color, index|
        if params[:sizes][index].to_i && params[:sizes][index].to_i > 0 && params[:sizes][index].to_i < 16
          size = ProductSize.new(price: params[:prices][index], UK: params[:sizes][index], EU: params[:sizes][index].to_i + 32, US: params[:sizes][index].to_i - 1, CM: params[:sizes][index].to_i * 2.54, product_id: @product.id)
        else
          size = ProductSize.new(size: params[:sizes][index], price: params[:prices][index], UK: params[:sizes][index], product_id: @product.id)
        end
        if size.save
          color = ProductColor.new(color: color, stock: params[:stocks][index], product_size_id: size.id)
          if color.save
            params[:images][index*3..index*3+2].each do |image|
              color.product_color_images.create(image_url: image)
            end
          else
            puts "ERROR: #{color.errors.full_messages}"
          end
        else
          puts "ERROR: #{size.errors.full_messages}"
        end
      end

      params[:materials].each do |material|
        @product.product_materials.create(material_id: Material.find_by(name: material).id)
      end

      @products = Product.all
      authorize! :access, :admin

      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace('admin-content', partial: 'admin/products/products', locals: { products: @products }) }
      end
    else
      puts "ERROR: #{@product.errors.full_messages}"
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace('alerts', partial: 'shared/alerts', locals: { alert: "Product could not be created" }) }
      end
    end
  end

  def new_color
    @product = Product.find(params[:product_id])
    @color = ProductColor.new
    authorize! :access, :admin

    respond_to do |format|
      @products = Product.all
      format.turbo_stream { render turbo_stream: turbo_stream.replace('admin-content', partial: 'admin/products/products', locals: { products: @products }),
        turbo_stream: turbo_stream.replace('product-modal', partial: 'admin/products/forms/add_color', locals: { color: @color }) }
    end
  end

  def create_color
    @product = Product.find(params[:product_id])
    authorize! :access, :admin
    
    if params[:size].to_i && params[:size].to_i > 0 && params[:size].to_i < 16
      size = ProductSize.new(price: params[:price], UK: params[:size], EU: params[:size].to_i + 32, US: params[:size].to_i - 1, CM: params[:size].to_i * 2.54, product_id: @product.id)
    else
      size = ProductSize.new(size: params[:size], price: params[:price], UK: params[:size], product_id: @product.id)
    end

    puts "SIZE: #{size.inspect}"
   
    if size.save
      puts "SIZE SAVED: #{size.inspect}"
      color = ProductColor.new(color: params[:color], stock: params[:stock], product_size_id: size.id)
    
    else
      puts "SIZE ERROR: #{size.errors.full_messages}"
    end

    puts '#' * 100
    puts params.inspect

    if color.save
      params[:images].each do |image|
        color.product_color_images.create(image_url: image)
      end
      @products = Product.all

      puts "Success: #{color.inspect}"
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace('admin-content', partial: 'admin/products/products', locals: { products: @products }) }
      end
    else
      puts "ERROR: #{color.errors.full_messages}"
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace('alerts', partial: 'shared/alerts', locals: { alert: "Color could not be created" }) }
      end
    end
  end  

  def new_category
    @category = Category.new
    authorize! :access, :admin

    respond_to do |format|
      @products = Product.all
      format.turbo_stream { render turbo_stream: turbo_stream.replace('admin-content', partial: 'admin/products/products', locals: { products: @products }),
        turbo_stream: turbo_stream.replace('product-modal', partial: 'admin/products/forms/add_category', locals: { category: @category }) }
    end
  end

  def create_category
    puts "CATEGORY PARAMS: #{category_params.inspect}"
    @category = Category.new(category_params)
    authorize! :access, :admin

    if @category.save
      @products = Product.all
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace('admin-content', partial: 'admin/products/products', locals: { products: @products }) }
      end
    else
      puts "ERROR: #{@category.errors.full_messages}"
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace('alerts', partial: 'shared/alerts', locals: { alert: "Category could not be created" }) }
      end
    end
  end

  # EDITs
  def edit_product
    @products = Product.all
    @product = Product.find(id_param[:id])
    authorize! :access, :admin

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace('admin-content', partial: 'admin/products/products', locals: { products: @products }),
        turbo_stream: turbo_stream.replace('product-modal', partial: 'admin/products/edit_product', locals: { product: @product, is_new: false }) }
    end
  end

  def edit_order
    @orders = Order.all.includes(:order_products)
    @order = Order.find(id_param[:id])
    authorize! :access, :admin

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace('admin-content', partial: 'admin/orders/orders', locals: { orders: @orders }),
                                          turbo_stream: turbo_stream.replace('order-modal', partial: 'admin/orders/edit_order', locals: { order: @order }) }
    end
  end

  # DELETEs
  def delete_product
    product = Product.find(id_param[:id])
    order_products = OrderProduct.where(product_id: product.id)
    if order_products.any?
      @products = Product.all

      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace('admin-content', partial: 'admin/products/products', locals: { products: @products }),
                                            turbo_stream: turbo_stream.replace('alerts', partial: 'shared/alerts', locals: { alert: "Product is in an order and cannot be deleted" }) }
        # add a flash message
      end
      return
    end

    cart_products = CartProduct.where(product_id: product.id)
    cart_products.destroy_all
    category_products = CategoryProduct.where(product_id: product.id)
    category_products.destroy_all
    @product.destroy
    authorize! :access, :admin

    @products = Product.all

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace('admin-content', partial: 'admin/products/products', locals: { products: @products }) }
    end
  end

  def update_product
    @product = Product.find(params[:id])
    authorize! :access, :admin
    
    #Update Main Product Model
    @product.update(update_product_params)

    #Update Product Colors
    params[:color_ids].each_with_index do |color_id, index|
      color = ProductColor.find(color_id) #find color
      color.update(color: params[:colors][index], stock: params[:stocks][index]) #update color and stock
      size = ProductSize.find(color.product_size_id) #find size
      # check if size is an integer
      if params[:sizes] && !params[:sizes][index].nil? # if size is an integer
        size.update(size: params[:sizes][index], price: params[:prices][index])  #update size and price
      else
        size.update(UK: params[:size_uks][index], price: params[:prices][index], EU: size.UK.to_i + 32, US: size.UK.to_i - 1, CM: size.UK.to_i * 2.54) #update size and price
      end

      #Update Color Images
      # take 3 images from the params[:color_images] array from the index*3 to index*3+3
      image_urls = ProductColorImage.where(product_color_id: color.id)
      image_urls.destroy_all
      params[:color_images][index*3..index*3+2].each do |image|
        color.product_color_images.create(image_url: image)
      end
    end 

    #Update Categories
    @product.categories.destroy_all
    params[:categories].each do |category|
      @product.categories << Category.find_by(name: category)
    end

    #Update Materials
    @product.product_materials.destroy_all
    params[:materials].each do |material|
      @product.product_materials.create(material_id: Material.find_by(name: material).id)
    end

    @products = Product.all
    
    respond_to do |format|
      # format.html { redirect_to products_path } # Redirect for HTML format
      format.turbo_stream { render turbo_stream: turbo_stream.replace('admin-content', partial: 'admin/products/products', locals: { products: @products }) } # Turbo Stream response
      format.any { head :not_acceptable } # Handle other formats gracefully
    end
  end

  def update_category
    @category = Category.find(params[:id])
    @category.update(category_params)
    authorize! :access, :admin

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace('admin-content', partial: 'admin/categories', locals: { categories: @categories }) }
    end
  end

  def ship_products
    order = Order.find(params[:order_id])
    shipment = Shipment.new(order_id: order.id, user_id: order.user_id, shipment_service: params[:courier], tracking_number: params[:tracking_number], expected_delivery: params[:expected_delivery].to_date)
    authorize! :access, :admin

    if shipment.save
      # If the record is valid, you can update the order_products
      order_products = order.order_products.where(product_color_id: params[:shipped_products]).update_all(status: 'shipped')

      # Optionally, you can redirect to another page or render a response
      @orders = Order.all.includes(:order_products)
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace('admin-content', partial: 'admin/orders/orders', locals: { orders: @orders }) }
      end
    else
      # If the record is invalid, you can render the form again, or redirect to another page
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace('alerts', partial: 'shared/alerts', locals: { alert: "Shipment could not be created" }) }
      end
    end
  end

  def refund_customer
    order = Order.find(params[:order_id])
    authorize! :access, :admin

    # If the record is valid, you can update the order_products
    order_products = order.order_products.where(product_color_id: params[:shipped_products]).update_all(status: 'complete')

    # Optionally, you can redirect to another page or render a response
    @orders = Order.all.includes(:order_products)
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace('admin-content', partial: 'admin/orders/orders', locals: { orders: @orders }) }
    end
  end

  def collect_products
    order = Order.find(params[:order_id])
    shipment = Shipment.new(order_id: order.id, user_id: order.user_id, shipment_service: params[:courier], tracking_number: params[:tracking_number], expected_delivery: params[:expected_delivery].to_date, job: 'collection')
    authorize! :access, :admin

    if shipment.save
      # If the record is valid, you can update the order_products
      order_products = order.order_products.where(product_color_id: params[:shipped_products]).update_all(status: 'collected')

      # Optionally, you can redirect to another page or render a response
      @orders = Order.all.includes(:order_products)
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace('admin-content', partial: 'admin/orders/orders', locals: { orders: @orders }) }
      end
    else
      # If the record is invalid, you can render the form again, or redirect to another page
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace('alerts', partial: 'shared/alerts', locals: { alert: "Shipment could not be created" }) }
      end
    end
  end

  def manage_order
    @order = Order.find(manage_order_params[:id])
    authorize! :access, :admin

    puts "ACTION: #{manage_order_params.inspect}"

    respond_to do |format|
      if manage_order_params[:do] == 'ship'
        format.turbo_stream { render turbo_stream: turbo_stream.replace('order-action', partial: 'admin/orders/forms/ship', locals: { order: @order }) } 
      elsif manage_order_params[:do] == 'exchange'
        format.turbo_stream { render turbo_stream: turbo_stream.replace('order-action', partial: 'admin/orders/forms/exchange', locals: { order: @order }) }
      elsif manage_order_params[:do] == 'refund'
        format.turbo_stream { render turbo_stream: turbo_stream.replace('order-action', partial: 'admin/orders/forms/refund', locals: { order: @order }) }
      elsif manage_order_params[:do] == 'collect'
        format.turbo_stream { render turbo_stream: turbo_stream.replace('order-action', partial: 'admin/orders/forms/collect', locals: { order: @order }) }
      end
    end
  end

  private
    def id_param
      params.permit(:id)
    end

    def product_params
      params.permit(:name,:description, :brand_id)
    end

    def manage_order_params
      params.permit(:id, :do, :shipped_products)
    end

    def update_product_params
      params.permit(:id, :name, :description, :brand_id)
    end

    def category_params
      params.permit(:name, :description, :image_url, :category_id)
    end
end
