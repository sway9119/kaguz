class NotificationsController < ApplicationController
  
  layout "home"

  def index
    @notifications = Notification.where(receiver_id: current_user.id)
  end

  def show
  end
end
