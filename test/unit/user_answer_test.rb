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
#  is_correct   :boolean
#

require 'test_helper'

class UserAnswerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
