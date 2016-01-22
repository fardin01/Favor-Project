class Favor < ActiveRecord::Base
  belongs_to :user

  scope :requested, -> {where(type: 'RequestedFavor')}
  scope :offered, -> {where(type: 'OfferedFavor')}

  def self.types
    %w(RequestedFavor OfferedFavor)
  end
end
