class LineItemsController < ApplicationController
    def create
        # binding.pry
        if !current_user.current_cart
            cart = Cart.new
            cart.user_id = current_user.id
            cart.save
            current_user.current_cart = cart
            current_user.save
            # current_user.create_current_cart
        end 

        line_item = current_user.current_cart.add_item(params[:item_id])
        
        if  line_item.save
        #   binding.pry
            @current_cart = current_user.current_cart
            redirect_to cart_path(@current_cart)
        else 
            redirect_to store_path
        end 
    end 

end
