class AddressesController < ApplicationController
  layout "layouts/order/application"
  def index
    @addresses = current_user.addresses
  end
  def new
    @address = current_use.addresses.new(:address_id => @address.id)
  end 
  def show 
  end 
  def create
    @address = current_user.addresses.build address_params
    respond_to  do |format|  
      if @address.save
        format.html { redirect_to user_addresses_path(current_user.id)}
        format.js
      else
        format.html { render 'addresses/new' }
        format.js
      end
    end 
  end
  def edit
  end

  def destroy
    @address = Address.find(params[:id])
    if @address.present?
      @address.destroy
      format.html {redirect_to user_address_path(@address) }
      format.json { head :no_content }
    end
  end

  private 
  def address_params
    params.require(:address).permit :user_name, :numberphone, :stress, :wards, :district, :province
  end
end
  