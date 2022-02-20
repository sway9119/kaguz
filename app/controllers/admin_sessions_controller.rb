class AdminSessionsController < ApplicationController
    def new
    end
  
    def create
      admin_user = AdminUser.find_by(email: params[:session][:email].downcase)
      if admin_user && admin_user.authenticate(params[:session][:password])
        log_in admin_user
        redirect_to root_path
      else
        render 'new'
      end
    end
  
    def destroy
      log_out if logged_in?
      redirect_to root_url
    end
end
