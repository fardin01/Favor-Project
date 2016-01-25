class AcceptancesController < ApplicationController

  def create
    @acceptance = Acceptance.create(acceptance_params)
    @acceptance.user_id = current_user.id

    if @acceptance.save
      redirect_to favors_path, notice: "Reuqest sent"
    else
      render :template => 'favors/index', notice: "Something went wrong"
    end
  end

  private

  def acceptance_params
    params.require(:acceptance).permit(:favor_id, :user_id)
  end
end