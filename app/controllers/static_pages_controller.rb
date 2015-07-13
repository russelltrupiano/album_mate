class StaticPagesController < ApplicationController

  before_action :user_logged_in, except: [:home, :help, :contact]


  def home
    unless !logged_in?
      redirect_to releases_url
    end
  end

  def releases
  end

  def subscriptions
  end

  def settings
  end

  def help
  end

  def contact
  end

  private

    def user_logged_in
      if !logged_in?
        redirect_to root_url
      end
    end
end
