module ApplicationHelper
  def full_title(page_title = '')
    base_title = "Admin | Food & Drink"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
  
  def save_cart(cart)
    session[:cart_id] = cart.id
  end
  
  def current_cart
    if !session[:cart_id].nil?
      Cart.find(session[:cart_id])     
    else
      Cart.new
    end
  end
end
