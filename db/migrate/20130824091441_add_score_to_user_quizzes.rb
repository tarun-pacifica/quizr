class AddScoreToUserQuizzes < ActiveRecord::Migration
  def change
    add_column :user_quizzes, :score, :integer
  end
end
