# == Schema Information
#
# Table name: quizzes
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  slug        :string(255)
#  user_id     :integer
#  description :string(255)


class Quiz < ActiveRecord::Base
  attr_accessible :name, :questions_attributes, :description
  has_many :questions
  has_many :answers, :through => :questions
  has_many :user_quizzes
  has_many :users, :through => :user_quizzes

  accepts_nested_attributes_for :questions, :reject_if => :all_blank, :allow_destroy => true

  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]
end
