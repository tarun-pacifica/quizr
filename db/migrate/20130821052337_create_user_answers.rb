class CreateUserAnswers < ActiveRecord::Migration
  def change
    create_table :user_answers do |t|
      t.integer :question_id
      t.integer :answer_id
      t.integer :user_quiz_id

      t.timestamps
    end
  end
end
