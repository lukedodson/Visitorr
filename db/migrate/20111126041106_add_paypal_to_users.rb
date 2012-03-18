class AddPaypalToUsers < ActiveRecord::Migration
  def change
    add_column :users, :paypal_customer_token, :string
    add_column :users, :paypal_recurring_profile_token, :string
  end
end
