class AddUserIdToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :user_id, :interger
  end
end
