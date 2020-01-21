class CartsController < ApplicationController

	def index
		@carts = Cart.all
	end

	def new
		@cart = Cart.new
	end

	def create
    	@cart = Cart.new(cart_params)
    	# @cart.user = current_user
		render action: 'new'
	end

	def show
		@cart = Cart.find(params[:id])
		qrcode = RQRCode::QRCode.new("http://localhost:3000/carts/#{params[:id]}")
		@svg = qrcode.as_svg(
		  offset: 0,
		  color: '000',
		  shape_rendering: 'crispEdges',
		  module_size: 6,
		  standalone: true
		)
		@current_contents = @cart.cart_contents.last
	end

	private

	# def set_cat
	# 	@cart = Cart.find(params[:id])
	# end

	def cart_params
		params.permit(:user_id)
	end

end
