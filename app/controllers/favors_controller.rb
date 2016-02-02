class FavorsController < ApplicationController
  before_action :set_favor, except: [:index, :new, :create]
  before_action :set_favor_type

  def index
    @near_users = current_user.nearbys(30)
    @favors = type_class.all
  end

  def new
    @favor = type_class.new
  end

  def create
    @favor = type_class.new(favor_params)
    @favor.user_id = current_user.id

    if @favor.save
      redirect_to @favor, notice: "Favor created successfully!"
    else 
      render 'new'
    end
  end

  def edit
  end

  def update
    @favor.update_attributes(favor_params)
    if @favor.save
      redirect_to @favor, notice: "Updated"
    else
      render "update"
    end
  end

  private

  def favor_params
    params.require(type.underscore.to_sym).permit(:title, :description, :type, :completed)
  end

  def set_favor_type
    @type = type
  end

  def type
    Favor.types.include?(params[:type]) ? params[:type] : 'Favor'
  end

  def type_class
    type.constantize
  end

  def set_favor
    @favor = type_class.find(params[:id])
  end

  def current_resource
    @favor ||= Favor.find(params[:id]) if params[:id]
  end
end
