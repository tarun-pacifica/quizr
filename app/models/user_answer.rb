# == Schema Information
#
# Table name: user_answers
#
#  id           :integer          not null, primary key
#  question_id  :integer
#  answer_id    :integer
#  user_quiz_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class UserAnswer < ActiveRecord::Base
  attr_accessible :answer_id, :question_id, :user_quiz_id
  belongs_to :user_quiz
end