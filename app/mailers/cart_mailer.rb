class CartMailer < ApplicationMailer
	def order_email(user)
		@user = user
		@account = @user.account
		@cart = @account.cart
		@order = @cart.products.to_a
		mail(to: @user.email, subject: 'your order')
	end
end