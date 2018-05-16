require_relative '00_init'

if Route.exists? #Routeにデータをぶち込まれてるか確認
  routes = Route.all
  #routes = Route.where(name: %w(JR中央線 JR京浜東北線))
  routes.each do |route|
    p route
    sleep(rand(10.0..30.0))
    p "えいえいっ。怒った?"
    result = get_api("http://express.heartrails.com/api/json?method=getStations&line=#{route.name}")
    unless result['response']['error'].present?
      p "怒ってないよ"
      result['response']['station'].each_cons(2) do |now_station, next_station|
        p now_station['name'] + " - " + next_station['name']
        route.route_stations.find_or_create_by(station_id: Station.find_by(name: now_station['name']).id) unless route.stations.create(name: now_station['name'],longitude: now_station['x'],latitude: now_station['y']).valid?
        route.route_stations.find_or_create_by(station_id: Station.find_by(name: next_station['name']).id) unless route.stations.create(name: next_station['name'],longitude: next_station['x'],latitude: next_station['y']).valid?
        station=Station.find_by(name: now_station['name'])
        p station
        if now_station['prev'].nil?
          p "prev nil"
          p station.lines.create(previous: nil, next: Station.find_by(name: now_station['next']).id, route_id: route.id)
        elsif now_station['next'].nil?
          p "next nil"
          p station.lines.create(previous: Station.find_by(name: now_station['prev']).id, next: nil, route_id: route.id)
        else
          p "else"
          p station.lines.create(previous: Station.find_by(name: now_station['prev']).id, next: Station.find_by(name: now_station['next']).id, route_id: route.id)
        end
        p Station.find_by(name: next_station['name']).lines.create(previous: Station.find_by(name: next_station['prev']).id, next: nil, route_id: route.id) if result['response']['station'].last['name'] == next_station['name'] #配列一番最後の処理をしたいのだがeach_conで一番最後なんて取得できないのでこんなコードに
      end
    else
      p "怒ったよ💢"
      p result['response']['error']
    end
  end
end