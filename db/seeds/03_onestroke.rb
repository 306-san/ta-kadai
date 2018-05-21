def decide_route(one_stroke_id,route_name, departure_station_name, destination_station)
  next_station_exists_is = true
  is_array_deleted = false
  onestroke_lines = Array.new # 一筆書きと路線情報を配列に入れてまとめてsaveする
  onestroke_stations = Array.new # 一筆書きと駅情報を配列に入れてまとめてsaveする
  route_id = Route.find_by(name: route_name).id
  line = Station.find_by(name: departure_station_name).lines.find_by(route_id: route_id)
  onestroke_lines << OnestrokeLine.new(onestroke_id: one_stroke_id, line: line)
  onestroke_stations << OnestrokeStation.new(onestroke_id: one_stroke_id, station_id: line.stations.first.id)
  until line.stations.first.name == destination_station do
    if next_station_exists_is == true
      before_line = line
      line = line.next_station
      unless line.nil?
        line = line.lines.find_by(route_id: route_id)
        onestroke_lines << OnestrokeLine.new(onestroke_id: one_stroke_id, line: line)
        onestroke_stations << OnestrokeStation.new(onestroke_id: one_stroke_id, station_id: line.stations.first.id)
      else
        line = before_line
        next_station_exists_is = false
      end
    else
      if is_array_deleted == false
        onestroke_lines = onestroke_lines.slice!(0,1)
        onestroke_stations = onestroke_stations.slice!(0,1)
        line = Station.find_by(name: departure_station_name).lines.find_by(route_id: route_id)
        is_array_deleted = true
      end
      line = line.prev_station
      unless line.nil?
        line = line.lines.find_by(route_id: route_id)
        onestroke_lines << OnestrokeLine.new(onestroke_id: one_stroke_id, line: line)
        onestroke_stations << OnestrokeStation.new(onestroke_id: one_stroke_id, station_id: line.stations.first.id)
      else
        p "ここに来たらおかしい"
      end
    end 
  end
    if next_station_exists_is == false
      onestroke_lines.reverse!
      onestroke_stations.reverse!
    end
  p onestroke_lines.first
  onestroke_lines.each do |onestroke_line|
    p onestroke_line.save
  end
  onestroke_stations.each do |onestroke_station|
    p onestroke_station.save
  end
end

if Route.exists? #Stationにデータをぶち込まれてるか確認
  Onestroke.destroy_all
  onestroke_id = Onestroke.create.id
  decide_route(onestroke_id,"東北新幹線","東京","仙台")
  decide_route(onestroke_id,"JR東北本線","仙台","岩沼")
  decide_route(onestroke_id,"JR常磐線","岩沼","取手")
  decide_route(onestroke_id,"JR常磐線快速","取手","上野")
  decide_route(onestroke_id,"JR上野東京ライン","上野","東京")
end
