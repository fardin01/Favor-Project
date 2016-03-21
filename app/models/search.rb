class Search < ActiveRecord::Base

  has_many :rewards_searches
  has_many :rewards, through: :rewards_searches

  def favors
    @favors ||= find_favors
  end

private

  def find_favors
    if requested
      favors = Favor.requested 
    elsif offered
       favors = Favor.offered 
     end
    favors = Favor.where("title LIKE ? OR description LIKE ?", "%#{keywords}%", "%#{keywords}%") if keywords.present?
    favors = Favor.all.find_all{ |favor| favor.rewards.any?{|reward| self.rewards.include?(reward) }} if rewards.any?
    favors
  end
end
