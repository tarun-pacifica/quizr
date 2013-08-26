# == Schema Information
#
# Table name: user_quizzes
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  quiz_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  score      :integer
#

class UserQuiz < ActiveRecord::Base
  attr_accessible :is_owner, :quiz_id, :user_id, :score
  belongs_to :user
  belongs_to :quiz
  has_many :user_answers

  validates_uniqueness_of :quiz_id

  def complete?
    if self.quiz.questions.count == 0 || self.quiz == []
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
    ((correct_answer_count.to_f/question_count) * 100).round
  end

end
