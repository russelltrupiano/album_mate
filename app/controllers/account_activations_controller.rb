class AccountActivationsController < ApplicationController

  def edit
    user = User.find_by(email: params[:email])
    # params[:id] holds @user.authentication_token
    if user && user.authenticated?(:activation, params[:id])
      user.activate
      log_in user
    else
      flash[:danger] = "Invalid activation link"
    end
    redirect_to root_url
  end

end
