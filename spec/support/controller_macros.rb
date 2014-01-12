module ControllerMacros
  def require_logged_user(path)
    before {get path}
    it {should redirect_to(new_user_session_path)}
  end
end