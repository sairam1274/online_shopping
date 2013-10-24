class OrdersController < ApplicationController
  before_action :authenticate_customer!
  def view_orders
  	@orders=current_customer.orders
  end

  

  def create
  	@cart = Cart.find(params[:id])
    
    @cart.products.each do |product|

   	   @order = current_customer.orders.build(product_id: product.id)
       @order.save

       end
       
       
    Cart.find(params[:id]).destroy
    @orders = current_customer.orders
    render "checkout"
     
  end

  

  
end



