class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :address
      t.string :phone
      t.string :video_url
      t.string :subject
      t.text :body
      t.integer :user_id

      t.timestamps
    end
  end
end
