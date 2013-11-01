class AddCreditsToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :used_credits, :integer
  end
end
