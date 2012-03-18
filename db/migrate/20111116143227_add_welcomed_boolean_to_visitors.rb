class AddWelcomedBooleanToVisitors < ActiveRecord::Migration
  def change
    add_column :visitors, :welcomed, :boolean, :default => false
  end
end
