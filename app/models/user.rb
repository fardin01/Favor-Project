class User < ActiveRecord::Base
  before_create :set_user_full_name
  
  has_many :favors
  has_many :acceptances

  has_secure_password

  geocoded_by :city
  after_validation :geocode, :if => :city_changed?

  def to_be_done_favors
    undones = user_acceptances_favors.find_all { |favor| !favor.completed }
    undones.map{ |undone| undone }
  end

  def done_favors
    dones = user_acceptances_favors.find_all { |favor| favor.completed }
    dones.map{ |done| done  }
  end

  def user_acceptances_favors
    self.acceptances.select { |ac| ac.accepted }.map{ |ac| ac.favor }
  end

  private

  def set_user_full_name
    self.name = "#{firstname}" + " " + "#{lastname}"
  end
end
