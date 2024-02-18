class HomeController < ApplicationController
  def index
    @user = current_user
    @products = Product.all
    @categories = Category.all

    puts '#' * 100
    puts params.inspect
    puts @user.inspect
    puts @products.inspect
    puts @categories.inspect
    puts '#' * 100


    @results_products = []
  end
end
