class RenameRefreshToSecret < ActiveRecord::Migration
  def change
    rename_column :authorizations, :oauth_refresh_token, :oauth_secret
  end
end
