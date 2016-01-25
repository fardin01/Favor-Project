class User < ActiveRecord::Base
  has_many :favors
  has_many :acceptances

  has_secure_password

  geocoded_by :city
  after_validation :geocode, :if => :city_changed?
end
