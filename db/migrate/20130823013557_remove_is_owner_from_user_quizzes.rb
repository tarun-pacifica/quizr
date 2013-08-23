class RemoveIsOwnerFromUserQuizzes < ActiveRecord::Migration
  def change
    remove_column :user_quizzes, :is_owner
  end
end
