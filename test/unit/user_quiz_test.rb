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

require 'test_helper'

class UserQuizTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end