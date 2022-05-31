class CartsController < ApplicationController
  def index
    @cart = current_cart
    @cart_items = @cart.cart_items.includes(:product).order(created_at: :desc)
    @order = current_cart.order
  end
  def create
    
  end
  private
  def cart_params
    params.require(:cart).permit :total_amount
  end
end
