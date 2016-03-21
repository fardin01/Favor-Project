class Reward < ActiveRecord::Base
  has_many :compensations
  has_many :favors, through: :compensations

  has_many :rewards_searches
  has_many :searches, through: :rewards_searches
end
