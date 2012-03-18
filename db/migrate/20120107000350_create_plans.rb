class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :name
      t.decimal :price
      t.integer :email_limit

      t.timestamps
    end
  end
end
