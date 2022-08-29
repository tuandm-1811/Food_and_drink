class UsersController < ApplicationController
  def show
    @orders = current_user.orders
    @products = current_cart.products
  end 
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = current_user.user_id
    respond_to do |format|
      if current_user.update(user_params)
        format.html { redirect_to user_path, notice: 'Cập nhập người dùng thành công.' }
        format.js  
      else
        format.html { redirect_to user_path, notice: 'Cập nhập người dùng thất bại.' }
        format.js
      end
    end
  end
  private 
  def user_params
    params.require(:user).permit(:name, :id, :birth, :gender, :user_id, :email,:passwords, :confirm_password, user: [:_method, :authenticity_token, :commit])
  end
end
  