class DiscogsController < ApplicationController

  before_filter do
    @discogs = Discogs::Wrapper.new("Album Checker", session[:access_token])
  end

  def authenticate
    app_key      = ENV["DISCOGS_API_KEY"]
    app_secret   = ENV["DISCOGS_API_SECRET"]
    request_data = @discogs.get_request_token(app_key, app_secret, "http://127.0.0.1:3000/discogs/callback")
    session[:request_token] = request_data[:request_token]
    debugger
    redirect_to request_data[:authorize_url]
  end

  def callback
    request_token = session[:request_token]
    verifier      = params[:oauth_verifier]
    debugger
    access_token  = @discogs.authenticate(request_token, verifier)

    session[:request_token] = nil
    session[:access_token] = access_token

    redirect_to :action => "index"
  end

  def index
  end

  def show
  end

  def edit
  end

  def create
  end

  def update
  end
end
