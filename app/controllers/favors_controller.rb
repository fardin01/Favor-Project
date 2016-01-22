class FavorsController < ApplicationController
  before_action :set_favor_type
  before_action :set_favor, except: [:index, :new, :create]


  def index
    @favors = type_class.all
  end

  def new
    @favor = type_class.new
  end

  def create
    @favor = current_user.favors.new(favor_params)

    if @favor.save
      redirect_to @favor, notice: "Favor created successfully!"
    else 
      render 'new'
    end
  end

  private

  def favor_params
    params.require(type.underscore.to_sym).permit(:title, :description, :type)
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
end




