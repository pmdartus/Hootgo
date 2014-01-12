class CreateAuthorizations < ActiveRecord::Migration
  def change
    create_table :authorizations do |t|
      t.string :provider
      t.string :uid
      t.integer :user_id
      t.text :oauth_token
      t.text :oauth_refresh_token
      t.datetime :oath_expires_at

      t.timestamps
    end
  end
end
