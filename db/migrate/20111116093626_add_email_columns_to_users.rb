class AddEmailColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :subject, :string
    add_column :users, :email_body, :text
  end
end
