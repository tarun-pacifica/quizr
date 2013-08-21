# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  address         :string(255)
#  password_digest :string(255)
#  lat             :float
#  long            :float
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :address, :email, :lat, :long, :name, :password_digest
  has_many :quizzes, :through => :user_quizzes
  has_many :user_quizzes
end
