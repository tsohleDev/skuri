class WishlistsController < ApplicationController
  before_action :set_wishlist, only: %i[ show edit update destroy ]

  def add_to_wishlist
    puts "add_to_wishlist"
    @wishlist = Wishlist.find_by(user_id: current_user.id)
    @product = Product.find_by(id: params[:id])

    # check if product is already in wishlist
    @wishlist_item = WishlistProduct.find_by(wishlist_id: @wishlist.id, product_id: @product.id)

    if @wishlist_item.nil?
      @wishlist_item = WishlistProduct.new
      @wishlist_item.wishlist_id = @wishlist.id
      @wishlist_item.product_id = @product.id
    end

    if @wishlist_item.save
      puts "saved"
    else
      puts "not saved"
    end

    # no redirect just notify user
    # format.json { render :show, status: :created, location: @wishlist }
  end

  def remove_from_wishlist
    puts "remove_from_wishlist"
    @wishlist = Wishlist.find_by(user_id: current_user.id)
    @product = Product.find_by(id: params[:id])

    # find and destroy wishlist item
    @wishlist_item = WishlistProduct.find_by(wishlist_id: @wishlist.id, product_id: @product.id).destroy

    # no redirect just notify user
    # format.json { render :show, status: :created, location: @wishlist }
  end

  # GET /wishlists/1 or /wishlists/1.json
  def show
    @user = current_user
    wishlist = Wishlist.find_by(user_id: current_user.id)
    authorize! :read, Wishlist, user_id: current_user.id, message: "You are not authorized to view this wishlist."

    if wishlist.nil?
      wishlist = Wishlist.new
      wishlist.user_id = current_user.id

      if not wishlist.save
        format.html { redirect_to root_path, notice: "Error creating wishlist." }
      end
    end

    @wishlist_products = WishlistProduct.where(wishlist_id: wishlist.id)
    @products = @wishlist_products.map { |wishlist_product| wishlist_product.product }
  end

  # GET /wishlists/new
  def new
    @wishlist = Wishlist.new
  end

  # GET /wishlists/1/edit
  def edit
  end

  # POST /wishlists or /wishlists.json
  def create
    @wishlist = Wishlist.new(wishlist_params)

    respond_to do |format|
      if @wishlist.save
        format.html { redirect_to wishlist_url(@wishlist), notice: "Wishlist was successfully created." }
        format.json { render :show, status: :created, location: @wishlist }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @wishlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wishlists/1 or /wishlists/1.json
  def update
    respond_to do |format|
      if @wishlist.update(wishlist_params)
        format.html { redirect_to wishlist_url(@wishlist), notice: "Wishlist was successfully updated." }
        format.json { render :show, status: :ok, location: @wishlist }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @wishlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wishlists/1 or /wishlists/1.json
  def destroy
    @wishlist.destroy

    respond_to do |format|
      format.html { redirect_to wishlists_url, notice: "Wishlist was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wishlist
      @wishlist = Wishlist.find_by(user_id: current_user.id)
    end

    # Only allow a list of trusted parameters through.
    def wishlist_params
      params.require(:wishlist).permit(:user_id)
    end
end
