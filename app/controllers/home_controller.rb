class HomeController < ApplicationController
  def index
    @user = current_user
    @products = Product.all
    @categories = Category.all
  end

  def search
  end
end
