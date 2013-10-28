class OrdersController < ApplicationController
  before_action :authenticate_customer!
  def view_orders
  	@orders=current_customer.orders
  end

  

  def create
  	@cart = Cart.find(params[:id])
    @current_order = []
    @cart.products.each do |product|

   	   @order = current_customer.orders.build(product_id: product.id)
       @order.save
       @current_order << @order

       end
       
       
    Cart.find(params[:id]).destroy
    
    render "checkout"
     
  end

  

  
end



