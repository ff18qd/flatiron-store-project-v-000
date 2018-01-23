class CartsController < ApplicationController
    def show 
        # binding.pry
        @current_cart = current_user.current_cart
    end 
    
    def checkout
        @current_cart = Cart.find(params[:id])
        @current_cart.checkout
        current_user.current_cart_id = nil
        current_user.save
        redirect_to cart_path(@current_cart)
    end 


end
