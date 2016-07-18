class CartController < ApplicationController
	before_filter :authenticate_user!

	def get_owner
		@owner = current_user.account
		
		if @owner.cart.blank?

			@cart = Cart.create
			@owner.cart = @cart

			#@cart.account = @owner
			@cart.save
		end
	end
	
	def show_products
		@owner = current_user.account		
		@products = @owner.cart.products
		
	end

end