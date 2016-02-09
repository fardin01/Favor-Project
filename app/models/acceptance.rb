class Acceptance < ActiveRecord::Base
  belongs_to :user
  belongs_to :favor
  belongs_to :requested_favor
  belongs_to :offered_favor

  has_many :activities, as: :trackable
end
