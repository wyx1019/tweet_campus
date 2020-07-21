class ApplicationController < ActionController::Base
    before_action :set_current_user
  
    def set_current_user
      @current_user = User.find_by(id: session[:user_id])
    end
    
    def not_login_user
      if @current_user == nil
        flash[:danger] = "ログインが必要です"
        redirect_to login_path
      end
    end
    
    def forbid_login_user
      if @current_user
        flash[:danger] = "すでにログインしています"
        redirect_to about_path
      end
    end
end
