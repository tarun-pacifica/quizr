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
#  slug            :string(255)
#

class User < ActiveRecord::Base
  before_save :geocode
  attr_accessible :address, :email, :lat, :long, :name, :password_digest
  has_many :quizzes, :through => :user_quizzes
  has_many :user_quizzes
  has_secure_password
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  def geocode
    #over API query limit fix
    # self.latitude = 32.3456
    # self.longitude = 141.4346

    result = Geocoder.search(self.address).first
      if result.present?
        self.lat = result.latitude
        self.long = result.longitude
      else
        self.latitude = 32.3456
        self.longitude = 141.4346
      end
  end
end