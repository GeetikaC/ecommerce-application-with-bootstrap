class WishlistsController < ApplicationController
	before_action :authenticate_user!
	def index
		@wishlists = current_user.wishlists
	end

	def create
		@wishlist = Wishlist.new(params[:wishlist].permit(:user_id, :product_id))
		@wishlist.user_id = current_user.id
		@wishlist.save
		# redirect_to wishlists_path, notice: "Successfully added to wishlist!"
	end

	def destroy
		@wishlist = Wishlist.find(params[:id])
		@wishlist.destroy
		redirect_to wishlists_path, notice: "Successfully deleted the item from your wishlist"
	end
end
