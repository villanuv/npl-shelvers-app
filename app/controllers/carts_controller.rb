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

	private

	# def set_cat
	# 	@cart = Cart.find(params[:id])
	# end

	def cart_params
		params.permit(:user_id)
	end

end
