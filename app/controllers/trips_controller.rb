class TripsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
  end

  def new
    @point = Point.new
  end

  def create
    @point = Point.new(point_params)
    if @point.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  private
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def point_params
    params.require(:point).permit(:address, :point_comment, images: [])
  end

end
