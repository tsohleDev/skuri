class HomeController < ApplicationController
  def index
    @user = current_user
    @products = Product.all
    @categories = Category.all

    puts '#' * 100
    puts params.inspect

    @results_products = []
  end
end
