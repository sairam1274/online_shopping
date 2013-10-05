class OrdersController < ApplicationController
  before_action :authenticate_customer!
  def view_orders
  	@orders=current_customer.orders
  end

  

  def create
  	
    
   	@order = current_customer.orders.build(:product_id => params[:id])
    if @order.save
       
       flash[:notice] = "Product added to cart"
       
       @product = Product.find(params[:id])
       render 'checkout'
     else
      flash[:notice] = "Product not added"
      redirect_to root_url
    end
  end

  

  
end



