class AcceptancesController < ApplicationController
  before_action :find_acceptance, only: :update
  before_action :current_resource, only: :create

  def create
    @acceptance = current_user.acceptances.build(acceptance_params)

    if @acceptance.save
      track_activity(@acceptance)
      redirect_to favor_path(@acceptance.favor), notice: "Reuqest sent"
    else
      render :template => 'favors/index', notice: "Something went wrong"
    end
  end

  def update
    @acceptance.update_attribute(:accepted, true)

    @acceptance.favor.acceptances.each do |rejected_ac|
      rejected_ac.accepted = false unless rejected_ac == @acceptance
      track_activity(rejected_ac)
    end

    if @acceptance.save
      redirect_to favor_path(@acceptance.favor), notice: "Accepted"
    else
      raise "something went wrong"
    end
  end

  private

  def acceptance_params
    params.require(:acceptance).permit(:favor_id, :user_id)
  end

  def find_acceptance
    @acceptance = Acceptance.find(params[:id])
  end

  def current_resource
    if params[:action] == 'create'
      @favor ||= Favor.find(params[:acceptance][:favor_id]) 
    elsif params[:action] == 'update'
      @favor ||= find_acceptance.favor
    end
  end
end