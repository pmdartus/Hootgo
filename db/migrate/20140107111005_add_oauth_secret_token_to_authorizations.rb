class AddOauthSecretTokenToAuthorizations < ActiveRecord::Migration
  def change
    add_column :authorizations, :oauth_secret_token, :string
  end
end
