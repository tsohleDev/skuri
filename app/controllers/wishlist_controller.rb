class WishlistController < ApplicationController
  def index
    @wishlist = current_user.wishlist || Wishlist.create(user: current_user)
    @wishlist_products = WishlistProduct.where(wishlist: @wishlist)
  end

  def add
    if params[:product_colour_size_id].present?
      product_colour_size = ProductColourSize.find(params[:product_colour_size_id])
      @wishlist = current_user.wishlist || Wishlist.create(user: current_user)
      WishlistProduct.create(wishlist: @wishlist, product_colour_size: product_colour_size)

      respond_to do |format|
        response.turbo_stream { render turbo_stream: turbo_stream.replace('notice', partial: 'shared/notice', locals: { notice: 'Product added to wishlist' }) }
      end
    else
      respond_to do |format|
        response.turbo_stream { render turbo_stream: turbo_stream.replace('notice', partial: 'shared/notice', locals: { notice: 'Please select a size' }) }
      end
    end
  end

  def remove
    product = Product.find(params[:product_id])
    @wishlist = current_user.wishlist || Wishlist.create(user: current_user)
    WishlistProduct.find_by(wishlist: @wishlist, product: product).destroy
    redirect_to wishlist_index_path
  end
end
