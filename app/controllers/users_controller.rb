class UsersController < ApplicationController
  skip_before_filter :authenticate_user

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

    def edit
    end

    def update
    end
  end

  private

  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :city, :password, :password_confirmation)
  end

  def current_resource
    @user ||= current_user
  end
end