class ApplicationController < ActionController::Base
  before_action :authenticate_user
  before_action :authorize

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate_user
    redirect_to login_path if session[:user_id] == nil
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def user_signed_in?
    session[:user_id].present?
  end
  helper_method :user_signed_in?

  def current_permission
    @current_permission ||= Permission.new(current_user)
  end

  def authorize
    if !current_permission.allow?(params[:controller], params[:action], favor_object)
      redirect_to root_url, alert: "No no no. You can't do that!"
    end
  end

  # favor object has to be found because we are calling an instance method
  # has_accepted_acceptance? on it in `Permission` class `allow?` method
  def favor_object
    if params[:controller] == 'acceptances' && params[:action] == 'create'
      @favor ||= Favor.find(params[:acceptance][:favor_id]) 
    elsif params[:controller] == 'acceptances' && params[:action] == 'update'
      @favor ||= Acceptance.find(params[:id]).favor if params[:controller] == 'acceptances' && params[:action] == 'update'
    end
  end
end
