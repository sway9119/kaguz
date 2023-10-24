class Admin::SessionsController < ApplicationController

    layout "home"

    def create
        user = Admin::User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
          log_in user
          redirect_to admin_root_path
          flash[:success] = "ログインしました。"
        else        
            render 'new'
            flash[:danger] = "ログインできませんでした。"
        end
      end
    
      def destroy
        log_out if logged_in?
        redirect_to root_url
      end

end
