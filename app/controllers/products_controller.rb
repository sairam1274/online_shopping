class ProductsController < ApplicationController
	before_action :authenticate_customer!, only: [:new, :edit ]  
	def index
  	@products = Product.all
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
      params.require(:product).permit(:name, :price, :description)
                                   
    end
end
