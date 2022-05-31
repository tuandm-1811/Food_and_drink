class UsersController < ApplicationController
  def show
    @orders = current_user.orders
    @products = current_cart.products
  end 
end
  