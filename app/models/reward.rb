class Reward < ActiveRecord::Base
  has_many :compensations
  has_many :favors, through: :compensations
end
