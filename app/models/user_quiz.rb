# == Schema Information
#
# Table name: user_quizzes
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  quiz_id    :integer
#  is_owner   :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UserQuiz < ActiveRecord::Base
  attr_accessible :is_owner, :quiz_id, :user_id
  belongs_to :user
  belongs_to :quiz
  has_many :user_answers
end
