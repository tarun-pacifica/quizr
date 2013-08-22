# == Schema Information
#
# Table name: quizzes
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string(255)
#

class Quiz < ActiveRecord::Base
  attr_accessible :name
  has_many :questions
  has_many :answers, :through => :questions
  has_many :user_quizzes
  has_many :users, :through => :user_quizzes
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]
end
