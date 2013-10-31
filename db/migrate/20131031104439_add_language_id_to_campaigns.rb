class AddLanguageIdToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :language_id, :integer
  end
end
