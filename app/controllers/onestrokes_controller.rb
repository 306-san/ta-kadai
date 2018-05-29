class OnestrokesController < ApplicationController
  def index
  end

  def show
    @onestrokes = []
    @transfer_stations_array = []
    has_passed_through_via_station = false
    p params[:first_end_station]
    p params[:first_end_station]
    p onestroke_ids = Station.find_by(name: params[:first_end_station].split("駅")).onestrokes.ids.uniq
    onestroke_ids.reject! {|onestroke_id| OnestrokeStation.find_by(onestroke_id: onestroke_id, station: Station.find_by(name: params[:via_station].split('駅'))).nil? }
    # 乗り換えるべき駅を探索(中間テーブルからstation_idが2つ以上ある駅を抽出)
    onestroke_ids.each do |onestroke_id|
      transfer_stations = []
      transfer_route_names = []
      has_passed_through_via_station = false
      transfer_station_ids=OnestrokeStation.where(onestroke_id: onestroke_id).group(:station_id).having("count(station_id) >= ?", 2).count.keys
      transfer_lines = OnestrokeLine.where(id: OnestrokeStation.where(onestroke_id: onestroke_id).where(station_id: transfer_station_ids).ids.sort)
      before_route_name = nil
      p transfer_lines
      # binding.pry
     transfer_lines.each do |transfer_line|
        p "before_route: " + before_route_name.to_s
        p transfer_line.line.stations.first.name
        p transfer_line.line.route.name
        if transfer_line.line.route.name  == before_route_name
          onestroke_via_station = Station.find_by(name: params[:via_station].split('駅')).onestroke_stations.find_by(onestroke_id: onestroke_id)
          if ( transfer_line.id > onestroke_via_station.id ) && (has_passed_through_via_station == false) && (transfer_station_ids.exclude?(onestroke_via_station.station.id))
            p "add via_station"
            transfer_stations << onestroke_via_station.station
            transfer_route_names << OnestrokeLine.find(onestroke_via_station.id).line.route
            has_passed_through_via_station = true
          else
            p "skiped"
            next
          end
        else
          p "To add"
          transfer_stations << transfer_line.line.stations.first
          transfer_route_names << transfer_line.line.route
          before_route_name = transfer_line.line.route.name
        end
      end
    transfer_stations << transfer_lines.last.line.stations.first
    @onestrokes << transfer_stations
    @transfer_stations_array << transfer_route_names
    @storoke_ids = onestroke_ids
    end
end
