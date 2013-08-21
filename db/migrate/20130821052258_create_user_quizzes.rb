class CreateUserQuizzes < ActiveRecord::Migration
  def change
    create_table :user_quizzes do |t|
      t.integer :user_id
      t.integer :quiz_id
      t.boolean :is_owner

      t.timestamps
    end
  end
end
