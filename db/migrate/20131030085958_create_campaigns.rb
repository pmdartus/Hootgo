class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.text :initial
      t.text :translation
      t.string :langage

      t.timestamps
    end
  end
end
