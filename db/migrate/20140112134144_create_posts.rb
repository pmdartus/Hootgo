class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :campaign_id
      t.integer :page_id
      t.integer :translation_id
      t.integer :twitter_post_id

      t.timestamps
    end
  end
end
