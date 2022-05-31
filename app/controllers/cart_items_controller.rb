class CartItemsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate
  before_action :get_current_cart
  def create
    @cart_item = @cart.cart_items.find_by product_id: cart_item_params[:product_id]
    if @cart_item 
      tatal_quantity = cart_item_params[:quantity].to_i + @cart_item.quantity
      @cart_item.assign_attributes quantity: tatal_quantity ,
        total_product: tatal_quantity * @cart_item.product.price
    else
      @cart_item = @cart.cart_items.build cart_item_params
      @cart_item.total_product = @cart_item.product.price * @cart_item.quantity#@cart_item.quantity
    end
    respond_to do |format|
      if @cart_item.save
        if @cart.save
          save_cart(@cart)
          @cart.update total_amount: @cart.caculate_total_amount.sum, user_id: current_user.id
        else
        end
        format.html{ redirect_to carts_path}
        format.js
      else
        format.html { redirect_to carts_path }
        format.js
      end
    end    
  end
  def update
    @cart_item = current_cart.cart_items.find(params[:id])
    respond_to do |format|
      if @cart_item.update(cart_item_params)
        @cart.update total_amount: @cart.caculate_total_amount.sum
        format.html { redirect_to carts_path, notice: 'Update product in cart successfull.' }
        format.js  
      else
        format.html { redirect_to carts_path, notice: 'Update product in cart failed.' }
        format.js
      end
    end
    @cart_items = current_cart.cart_items
  end
  def destroy
    @cart_item = current_cart.cart_items.find(params[:id])
    respond_to do |format|
      if @cart_item.destroy
        format.html { redirect_to root_path, notice: 'Update product in cart successfull.' }
        format.js  
      else
        format.html { redirect_to carts_path, notice: 'Update product in cart failed.' }
        format.js
      end
    end
    
  end
  private
  def cart_item_params
      params.require(:cart_item).permit :quantity ,:product_id
  end
  def get_current_cart
    @cart = current_cart
  end
  def authenticate
    redirect_to login_path unless signed_in?
  end
end
