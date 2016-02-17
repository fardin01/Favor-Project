class Search < ActiveRecord::Base

  def favors
    @favors ||= find_favors
  end

private

  def find_favors
    favors = Favor.all
    favors = favors.where("title LIKE ? OR description LIKE ?", "%#{keywords}%", "%#{keywords}%") if keywords.present?
    favors = favors.requested if requested
    favors = favors.offered if offered
    #favors = by_rewards(favors)
    favors
  end

  def by_rewards(favors)
    #rewards.map{|reward| reward.id  }
    favors.each do |favor|
      favor.rewards

    end

  end
end
