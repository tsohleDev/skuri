class WishlistController < ApplicationController
  def index
    @wishlist = current_user.wishlist || Wishlist.create(user: current_user)
    @wishlist_products = WishlistProduct.where(wishlist: @wishlist)
  end

  def add
    if current_user.nil?
      redirect_to new_user_session_path
      return
    end


    @wishlist = current_user.wishlist || Wishlist.create(user: current_user)
    if params[:colour_id].present? && params[:size_id].present?
      product = ProductColourSize.find_by(product_id: params[:product_id])

      wishlist_product = WishlistProduct.new(wishlist: @wishlist, product_colour_size: product)
      if wishlist_product.save
        respond_to do |format|
          format.turbo_stream { render turbo_stream: turbo_stream.append('alers', partial: 'shared/alerts', locals: { notice: 'Product added to wishlist' }) }
        end
      else
        puts '#'*100
        puts wishlist_product.errors.full_messages
        respond_to do |format|
          format.turbo_stream { render turbo_stream: turbo_stream.append('alers', partial: 'shared/alerts', locals: { notice: 'Product not added to wishlist' }) }
        end
      end
    end
  end

  def remove
    @wishlist = current_user.wishlist
    @wishlist_product = WishlistProduct.find(params[:product_id])
    @wishlist_product.destroy
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.remove("item_#{params[:id]}"),
          turbo_stream.append('alerts', partial: 'shared/alerts', locals: { notice: 'Product removed from wishlist' })
        ]
      end
    end
  end
end
