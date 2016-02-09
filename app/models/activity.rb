class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :trackable, polymorphic: true

  before_validation :set_type

  # This sets trackable_type to either OfferedFavor 
  # or RequestedFavor instead of only Favor
  def set_type
    self.trackable_type = trackable.class.name
  end
end
