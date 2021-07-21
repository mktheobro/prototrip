class TripsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
  end

  def new
    # @point = Point.new
    @trip_point = TripsPoint.new
  end

  def create
    @trip_point = TripsPoint.new(point_params)
    if @trip_point.valid? 
      @trip_point.save
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
    params.require(:trip_point).permit(:trip_date, :trip_title, :trip_comment, :address, :point_comment, images: []).merge(:trip_id,:point_id,:user_id)
  end

  # def point_params
  #   params.require(:point).permit(:address, :point_comment, images: [])
  # end

end
