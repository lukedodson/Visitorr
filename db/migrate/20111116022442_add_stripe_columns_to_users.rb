class AddStripeColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_4_digits, :string
    add_column :users, :stripe_id, :string
    add_column :users, :subscribed, :boolean, :default => false
  end
end
