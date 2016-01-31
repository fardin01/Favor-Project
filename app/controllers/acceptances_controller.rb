class AcceptancesController < ApplicationController
  before_action :find_acceptance, only: :update
  before_action :find_favor_for_create, only: :create

  def create
    @acceptance = current_user.acceptances.build(acceptance_params)

    if @acceptance.save
      redirect_to favor_path(@acceptance.favor), notice: "Reuqest sent"
    else
      render :template => 'favors/index', notice: "Something went wrong"
    end
  end

  def update
    @acceptance.update_attribute(:accepted, true)

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

  def find_favor_for_create
    @favor ||= Favor.find(params[:acceptance][:favor_id])
  end
end