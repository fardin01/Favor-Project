class ActivitiesController < ApplicationController

  def index
    @favor_activities = []
    current_user.favors.each do |favor| 
      favor.acceptances.each do |ac|
        @favor_activities += ac.activities.find_all{ |ac| ac.action == "create" }
        end
      end
    current_user.acceptances.each do |act|
      @favor_activities += act.activities.find_all{ |ac| ac.action == "update" }
    end
  end
end