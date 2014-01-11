class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :authorization_id
      t.string :name
      t.integer :language_id
      t.string :image

      t.timestamps
    end
  end
end
