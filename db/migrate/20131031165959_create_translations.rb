class CreateTranslations < ActiveRecord::Migration
  def change
    create_table :translations do |t|
      t.integer :language_id
      t.text :translated_text
      t.string :status
      t.integer :campaign_id

      t.timestamps
    end
  end
end
