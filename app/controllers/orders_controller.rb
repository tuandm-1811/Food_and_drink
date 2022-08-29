class OrdersController < ApplicationController
  layout "layouts/order/application"
  before_action :get_valid_to_order
  before_action :get_id_order, only:[:show, :destroy]
  def new
    @order = Order.new
    @cart_items = current_cart.cart_items 
    @address = current_user.addresses.find params[:address_id]
  end
  def show;end
  
  def create
    binding.pry
    unless current_cart.blank?
    @order = current_user.orders.build order_params
    @order.save_price_to_order = current_cart.total_price_after_coupons
    @order.order_code = Order.generate_order_code
    @order.confirm!
    if @order.save

      ([current_user]).each do |user|
        Notification.create(recipient: user, actor: current_user, action: "posted", notifiable: @order)
      end
      OrderMailer.with(order: @order).new_order_email.deliver_later
      session[:cart_id] = nil
      flash[:success] = 'Bạn đã đặt hàng thành công'
      redirect_to order_path(@order)
    else
      flash[:danger] = 'Bạn đã đặt hàng thất bại'
      render :new
    end
    else
      flash[:danger] = "Bạn cần phải đặt hàng!"
      redirect_to products_path
    end
  end
  def destroy
    @order.cancel!
    if @order.destroy
      redirect_to root_path
    else
      redirect_to :show
    end
  end
  private
  def get_id_order
    @order = Order.find params[:id]
  end
  
  def order_params
    params.require(:order).permit :payments, :user_id,
    :cart_id, :address_id
  end 
  def get_valid_to_order
    redirect_to products_path unless current_cart.present?
  end
end
