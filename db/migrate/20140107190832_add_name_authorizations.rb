class AddNameAuthorizations < ActiveRecord::Migration
  def change
    add_column :authorizations, :name, :string
    add_column :authorizations, :photo_url, :string
    add_column :authorizations, :language_id, :integer
  end
end
