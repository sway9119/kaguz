class NotificationsController < ApplicationController
  
  layout "home"

  def index
    @notifications = Notification.where(receiver_id: current_user.id).order(created_at: "DESC")
  end

  def show
    @notification = Notification.find(params[:id])
  end
end
