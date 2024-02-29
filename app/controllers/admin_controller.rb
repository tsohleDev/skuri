class AdminController < ApplicationController
  def index
    #user must be logged in to view their profile
    if current_user == nil
      redirect_to new_user_session_path 
    end

    @user = current_user
  end

  def products
    @products = Product.all
    #authorize! :access, :admin

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace('admin-content', partial: 'admin/products/products', locals: { products: @products }) }
    end
  end

  def messages
    @help_messages = HelpMessage.all
    #authorize! :access, :admin

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace('admin-content', partial: 'admin/messages', locals: { messages: @help_messages }) }
    end
  end

  def edit_order
    @orders = Order.all.includes(:order_products).order(created_at: :asc)
    @order = Order.find(params[:id])
    @order_products = @order.order_products
    #authorize! :access, :admin

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace('order-modal', partial: 'admin/orders/edit_order', locals: { order: @order, order_products: @order_products }) }
    end
  end

  def orders
    @orders = Order.all.includes(:order_products).order(created_at: :asc)
    #authorize! :access, :admin

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace('admin-content', partial: 'admin/orders/orders', locals: { orders: @orders }) }
    end
  end

  def edit_product
    puts "Edit product"
    puts params.inspect

    @products = Product.all
    @product = Product.find(params[:id])
    #authorize! :access, :admin

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace('admin-content', partial: 'admin/products/products', locals: { products: @products }),
                            turbo_stream: turbo_stream.replace('product-modal', partial: 'admin/products/edit_product', locals: { product: @product, is_new: false }) }
    end
  end

  def new_product
    @products = Product.all.order(created_at: :desc)
    @categories = Category.all
    @product = Product.new
    #authorize! :access, :admin

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace('admin-content', partial: 'admin/products/products', locals: { products: @products }),
                            turbo_stream: turbo_stream.replace('product-modal', partial: 'admin/products/edit_product', locals: { product: @product, is_new: true }) }
    end
  end

  def delete_product
    @product = Product.find(id_param[:id])
    @product.destroy
    @products = Product.all
    #authorize! :access, :admin

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace('admin-content', partial: 'admin/products/products', locals: { products: @products }) }
    end
  end
end
