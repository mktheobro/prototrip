class TripsController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
  end

  def new
  end

  def create
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
    params.require(:point).permit(:address, :image)
  end

end
