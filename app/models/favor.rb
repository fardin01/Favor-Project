class Favor < ActiveRecord::Base

  belongs_to :user
  has_many :acceptances

  has_many :compensations
  has_many :rewards, through: :compensations

  scope :requested, -> {where(type: 'RequestedFavor')}
  scope :offered, -> {where(type: 'OfferedFavor')}

  def self.types
    %w(RequestedFavor OfferedFavor)
  end

  def acceptor_user
    acceptances.find{ |ac| ac.accepted }.user
  end

  def has_accepted_acceptance?
    acceptances.any?{ |ac| ac.accepted }
  end
end
