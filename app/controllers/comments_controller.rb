class CommentsController < ApplicationController
  before_action :get_id_product
  def create
    if signed_in?
      @comment = current_user.comments.build comment_params 
      respond_to  do |format|  
        if @comment.save
          format.html { redirect_to cproduct_path(@category, @product)}
          format.js
        else
          format.html { render 'products/show' }
          format.js
        end
      end 
    else
      redirect_to login_path
    end
  end
  private
  def get_id_product
    @product = Product.find(comment_params[:product_id])
  end
  def comment_params
    params.require(:comment).permit :content, :product_id, :user_id
  end
end