class HomeController < ApplicationController
  def index
    @user = current_user
    @categories = Category.first_three
    @products = Product.all
  end

  def search
  end
end
