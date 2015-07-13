module SessionsHelper

  # Log in the given user
  def log_in(user)
    session[:user_id] = user.id
  end

  # Remember a user in persistent cookie
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  # Get the current user if there is one
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: session[:user_id])
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  # Is there a user logged in?
  def logged_in?
    !current_user.nil?
  end

  # Log out the current user
  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end
end