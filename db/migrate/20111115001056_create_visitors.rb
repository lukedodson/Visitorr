class CreateVisitors < ActiveRecord::Migration
  def change
    create_table :visitors do |t|
      t.string :name
      t.string :email
      t.integer :user_id

      t.timestamps
    end
  end
end
