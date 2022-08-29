class Admin::HomepagesController < Admin::BaseController
  attr_accessor :products
  def index
    @category = Category.joins(:products) 
  end

  def search
    if params[:filter] == 'Day'
      @data = Order.group_by_day(:created_at).count
    elsif params[:filter] == 'Week'
      @data = Order.group_by_week(:created_at).count
    else params[:filter] == 'Month'
      @data = Order.group_by_month(:created_at).count
    end 
  end
end
