class Admin::OrdersController < Admin::BaseController
    before_action :get_order, only: [:index, :show, :destroy]
    def index 
        @order = Order.all
    end 
    def show;end
    
    def destroy 
        if order.present?
        @order.destroy
            respond_to do |format|
            format.js
            format.html {redirect_to admin_order_url(@order) }
            format.json { head :no_content }
            end
        end
    end
    private 
    def get_order
        params.permit(:name_product, :price, :payment, :order_code, :status, :order)
    end
end 
