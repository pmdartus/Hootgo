class AuthorizationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_authorization, only: [:show, :edit, :update, :destroy]

  def index
    @authorizations = current_user.authorizations
  end

  def create
    omniauth = request.env["omniauth.auth"]
    puts request.env["omniauth.auth"].to_json
    authorization = Authorization.where(provider: omniauth.provider, uid: omniauth.uid, user_id: current_user.id).first
    if authorization
      client = Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV["TW_APP_ID"]
        config.consumer_secret     = ENV["TW_APP_SECRET"]
        config.access_token        = authorization.oauth_token
        config.access_token_secret = authorization.oauth_secret_token
      end
      client.update("I'm tweeting with @gem!")
      flash[:notice] = "You had connected this application before"
      redirect_to authorizations_path
    else
      current_user.authorizations.create!(
        :provider => omniauth.provider,
        :uid => omniauth.uid,
        :oauth_token => omniauth.credentials.token,
        :oauth_secret_token => omniauth.credentials.secret
      )
      flash[:notice] = "The account ass been successfully linked."
      redirect_to authorizations_path
    end
  end

  def destroy
    @authorization.destroy
    flash[:notice] = "Successfully destroyed authorization."
    redirect_to authorizations_path
  end

  private

  def set_authorization
    @authorization = Authorization.find(params[:id])
    @authorization.user_id != current_user.id ? not_found : @authorization
  end

end