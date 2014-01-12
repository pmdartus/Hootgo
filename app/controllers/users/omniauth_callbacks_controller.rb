class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

<<<<<<< HEAD
  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)
    puts request.env["omniauth.auth"].to_json
    if @user.persisted?
      auth = request.env["omniauth.auth"]
      session['fb_access_token'] = auth.credentials.token
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def twitter
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    puts request.env["omniauth.auth"].to_json
    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"].provider, current_user)
=======
  def twitter
    auth = request.env["omniauth.auth"]
    puts auth.to_json
    @authorization = Authorization.find_with_oauth(auth)

    if @authorization.nil?
      # If no authorizations found, create a brand new one here
      @authorization = Authorization.create_with_oauth(auth)
    end
>>>>>>> master

    if current_user
      if @authorization.user == current_user
        # Authiorization already link with this account
        redirect_to root_url, notice: "Account already linked"
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