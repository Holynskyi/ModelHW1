# Preview all emails at http://localhost:3000/rails/mailers/cart_mailer
class CartMailerPreview < ActionMailer::Preview
	def order
		CartMailer.order_email(User.first)
	end
end
