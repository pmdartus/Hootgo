class AuthorizationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_authorization, only: [:show, :edit, :update, :destroy]

  def index
    @authorizations = current_user.authorizations
  end

  def create
    puts request.env["omniauth.auth"]
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