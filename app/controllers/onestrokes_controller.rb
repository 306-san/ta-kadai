class OnestrokesController < ApplicationController
  def index
  end

  def show
    p params[:first_end_station]
    p params
    Station.find_by(name: '東京')
  end
end
