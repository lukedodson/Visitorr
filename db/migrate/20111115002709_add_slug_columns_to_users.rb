class AddSlugColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :slug, :string
    add_column :users, :name, :string
  end
end
