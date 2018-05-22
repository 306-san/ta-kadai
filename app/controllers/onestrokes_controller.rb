class OnestrokesController < ApplicationController
  def index
  end

  def show
    p params[:first_end_station]
    p params
    p onestroke_ids = Station.find_by(name: params[:first_end_station]).onestrokes.ids.uniq
    onestroke_ids.reject! {|onestroke_id| OnestrokeStation.find_by(onestroke_id: onestroke_id, station: Station.find_by(name: params[:via_station])).nil? }
    # onestroke_ids.each do |onestroke_id|
    #   p onestroke_id
    #    if OnestrokeStation.find_by(onestroke_id: onestroke_id, station: Station.find_by(name: params[:via_station])).nil?
    #     onestroke_ids.delete(onestroke_id)
    #    else
    #     p "else id  " + onestroke_id.to_s
    #   end
    # end
    @storoke_ids = onestroke_ids
  end
end
