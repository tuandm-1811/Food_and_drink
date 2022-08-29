class Admin::UserController < Admin::BaseController
    before_action :get_user, only: [:show , :destroy]
    def index 
        @user = User.all
    end
    def show; end   

    def destroy 
        @user.destroy
        respond_to do |format|
            format.html { redirect_to admin_user_path, notice: 'Người dùng đã bị xóa'}
            format.js
        end
    end
    private
    def get_user
        params.require(:user).permit(:name, :id, :birth, :gender, :user_id, :email,:passwords, :confirm_password)
    end
end