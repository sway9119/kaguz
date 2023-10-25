# frozen_string_literal: true

module Admin
  # Sessionを管理するコントローラ
  class SessionsController < ApplicationController
    layout 'home'

    def create
      user = find_user_by_email

      if login_successful?(user)
        handle_successful_login(user)
      else
        handle_falled_login
      end
    end

    def destroy
      log_out if logged_in?
      redirect_to root_url
    end
  end
end

private

def find_user_by_email
  Admin::User.find_by(email: params[:session][:email].downcase)
end

def login_successful?(user)
  user&.authenticate(params[:session][:password])
end

def handle_successful_login(user)
  log_in user
  redirect_to admin_root_path
  flash[:success] = 'ログインしました。'
end

def handle_falled_login
  render 'new'
  flash[:danger] = 'ログインできませんでした。'
end
