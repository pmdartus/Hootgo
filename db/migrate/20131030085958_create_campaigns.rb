class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.text :source_text
      t.text :status

      t.timestamps
    end
  end
end
