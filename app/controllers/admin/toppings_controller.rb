class Admin::ToppingsController < Admin::BaseController
  def index
    @toppings = Topping.all
  end
  def create
    @topping = Topping.new topping_params
    respond_to  do |format|  
      if @topping.save
        format.html { redirect_to admin_toppings_path }
        format.js
      else
        format.html { redirect_to root_url }
        format.js
      end
    end 
  end
  def destroy
  end

  private
  def topping_params
    params.require(:topping).permit :name , :kind, :price , :product_id
  end
end
