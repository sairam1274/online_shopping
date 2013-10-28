class CartsController < ApplicationController
  def index
  end

  def new
  end

  def create
    cart_id = session[:cart_id]
    @cart = Cart.find(session[:cart_id])
    @product = Product.find(params[:id])
    @cart.products << @product
    
    # @cart_product = CartProducts.create(cart_id: cart_id, product_id: params[:id])
    
    redirect_to "/products"
  end

  def destroy
    cart_id = session[:cart_id]
    @cart = Cart.find(session[:cart_id])
    @product = Product.find(params[:id])
    @cart.products.delete(@product)
    redirect_to "/products"
    
  end

  def edit
  end

  def update
  end

  def checkout
    Cart.find(params[:id]).destroy
    redirect_to "/products"
  end
end

