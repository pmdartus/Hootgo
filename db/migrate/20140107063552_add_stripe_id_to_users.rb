class AddStripeIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :stripe_id, :interger
  end
end
