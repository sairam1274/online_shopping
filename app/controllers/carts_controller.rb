class CartsController < ApplicationController
  def index
  end

  def new
  end

  def create
    cart_id = session[:cart_id]
    @cart = Cart.find(session[:cart_id])
    @cart.product = Product.find(params[:id])
    @cart.save

    # @cart_product = CartProducts.create(cart_id: cart_id, product_id: params[:id])
    
    redirect_to "/products"
  end

  def destroy
  end

  def edit
  end

  def update
  end
end
