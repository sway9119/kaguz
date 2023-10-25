module Admin::SessionsHelper
  # 渡されたユーザーでログインする
  def log_in(admin_user)
    session[:admin_user_id] = admin_user.id
  end

  # 現在ログイン中のユーザーを返す (いる場合)
  def current_user
    return unless session[:admin_user_id]

    @current_admin_user ||= Admin::User.find_by(id: session[:admin_user_id])
  end

  # 受け取ったユーザーがログイン中のユーザーと一致すればtrueを返す
  def current_user?(admin_user)
    admin_user == current_user
  end

  # ユーザーがログインしていればtrue、その他ならfalseを返す
  def logged_in?
    !current_user.nil?
  end

  # 現在のユーザーをログアウトする
  def log_out
    session.delete(:admin_user_id)
    @current_admin_user = nil
  end
end
