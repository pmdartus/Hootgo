Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV["FB_APP_ID"], ENV["FB_APP_SECRET"], :scope => 'publish_stream,email,offline_access,manage_pages'
  provider :twitter, ENV["TW_APP_ID"], ENV["TW_APP_SECRET"]
end