class AddIsCorrectToUsersAnswers < ActiveRecord::Migration
  def change
    add_column :user_answers, :is_correct, :boolean
  end
end
