class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def twitter
    auth = request.env["omniauth.auth"]
    @authorization = Authorization.find_with_oauth(auth)

    if @authorization.nil?
      # If no authorizations found, create a brand new one here
      @authorization = Authorization.create_with_oauth(auth)
    end

    if user_signed_in?
      if @authorization.user == current_user
        # Authiorization already link with this account
        redirect_to pages_path, notice: "Account already linked"
      else
        # Authorization is not associated with this user
        @authorization.user = current_user
        @authorization.save()
        redirect_to pages_path, notice: "Account successfully linked"
      end
    else
      if @authorization.user.present?
        # The authorization was found but the user is not logged in
        session[:user_id] = @authorization.user_id
        sign_in_and_redirect @authorization.user, :event => :authentication
      else
        # The user is not logged in and the authorization is not found
        @user = User.create_with_oauth(auth)
        @authorization.user = @user
        @authorization.save()
        @user.save()

        session[:user_id] = @authorization.user_id
        sign_in_and_redirect @user, :event => :authentication
      end
    end
  end

end