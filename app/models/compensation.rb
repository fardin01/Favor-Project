class Compensation < ActiveRecord::Base
  belongs_to :favor
  belongs_to :reward
end
