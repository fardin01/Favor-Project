class UsersController < ApplicationController
  skip_before_filter :authenticate_user
  before_filter :find_favor, only: :update

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Welcome"
    else
      render 'new'
    end
  end

  def update
    @favor.update_attribute(:accepted, true)   
  end 

  private

  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :city, :password, :password_confirmation)
  end

  def find_favor
    @favor = Favor.find(params[:id])
  end
end