class OnestrokesController < ApplicationController
  def index
  end

  def show
    p params[:first_end_station]
    p params
  end
end
