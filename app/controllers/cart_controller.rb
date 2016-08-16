class CartController < ApplicationController
	before_filter :authenticate_user!

	def get_owner
		@owner = current_user.account		
		return redirect_to(accounts_path) unless @owner
  	@cart = @owner.cart || @owner.create_cart
  	@products = @owner.cart.products
	end
	

	def make_order
		CartMailer.order_email(current_user).deliver_later

		@owner = current_user.account		
		@products = @owner.cart.products
		@products.delete_all
	end

end