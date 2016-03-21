class RewardsSearch < ActiveRecord::Base
  belongs_to :reward
  belongs_to :search
end
