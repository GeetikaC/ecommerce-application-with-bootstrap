class CartLineItemsController < ApplicationController
def index
	@cart_line_item = CartLineItem.new
	#same as performing: CartLineItem.where(‘user_id=?’, current_user.id)
	@cart_line_items = current_user.cart_line_items #to find the cart items of the currently logged in user
end

def create
	@cart_line_item = CartLineItem.new(cart_line_item_params)
	@cart_line_item.user_id = current_user.id
	@cart_line_item.save_or_update
    # format.js
    # redirect_to cart_line_items_path, notice: "Successfully added to cart!"
end

def destroy
	@cart_line_item = CartLineItem.find(params[:id])
	@cart_line_item.destroy
	redirect_to cart_line_items_path, notice: "Item successfully deleted!"
end

private
def cart_line_item_params
	params[:cart_line_item].permit(:quantity, :product_id)
end

end
