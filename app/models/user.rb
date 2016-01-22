class User < ActiveRecord::Base
  has_many :favors

  has_secure_password
end
