# == Schema Information
#
# Table name: user_quizzes
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  quiz_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UserQuiz < ActiveRecord::Base
  attr_accessible :is_owner, :quiz_id, :user_id
  belongs_to :user
  belongs_to :quiz
  has_many :user_answers



  def complete?
    if self.quiz.questions.count == 0
      return false
    else
      self.quiz.questions.count == self.user_answers.count
    end
  end



  def correct_answer_count
    self.user_answers.where(:is_correct => true).count
  end

  def question_count
    self.quiz.questions.count
  end

  def score_percent
    ((self.correct_answer_count.to_f/self.question_count) * 100).round
  end

end
