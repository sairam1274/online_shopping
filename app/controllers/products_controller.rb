class ProductsController < ApplicationController
	before_action :authenticate_customer!, only: [:new, :edit ]  
	def index
  	@products = Product.all
    
    if customer_signed_in?
      @cart = Cart.find_by customer_id: @current_customer.id
      
       if @cart.blank?
         @cart = @current_customer.build_cart
         @cart.save
       end
      session[:cart_id] = @cart.id
      @cart_products = @cart.products       
    end
  end

  def new
  	@product = Product.new
  end
  
  def create
    @product = Product.new(user_params)
    if @product.save
    	
    	 flash[:notice] = "Product added succesfully"
      redirect_to(root_url)
    else
      render 'new'
    end
  end
    
  def destroy
     Product.find(params[:id]).destroy
     flash[:notice] = "Product deleted."
     redirect_to(root_url)
  end

  def edit
    	@product = Product.find(params[:id])
  end
    
  def update
      @product = Product.find(params[:id])
      if @product.update_attributes(user_params)
        flash[:success] = "Product Updated"
       
        redirect_to(root_url)
      else
        render 'edit'
      end
  end

  private

 def user_params
      params.require(:product).permit(:name, :price, :description, :image)
                                   
    end
end
