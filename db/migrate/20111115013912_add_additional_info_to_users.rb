class AddAdditionalInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :address, :string
    add_column :users, :phone, :string
    add_column :users, :video, :string
  end
end
