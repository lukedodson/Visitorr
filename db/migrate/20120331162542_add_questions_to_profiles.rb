class AddQuestionsToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :question_one, :string
    add_column :profiles, :question_two, :string
    add_column :profiles, :question_three, :string
    add_column :profiles, :question_four, :string
    add_column :profiles, :question_five, :string
  end
end
