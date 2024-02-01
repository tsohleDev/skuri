class AdminController < ApplicationController
  def index
    @user = current_user
    @help_messages = HelpMessage.all
    @orders = Order.all.includes(:order_products)
    @products = Product.all
    @users = User.all
    authorize! :access, :admin
  end
end
