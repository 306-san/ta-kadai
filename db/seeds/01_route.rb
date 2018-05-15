require_relative '00_init'

areas= %w(関東 東北)

areas.each do |area|
  p "Getting #{area} area Route Data from Express.HeartRails API..."
  p " To reduce stress API server Pleasewait...."
  p "えいえい怒った?"
  sleep(rand(5.0..20.0))
  result = get_api("http://express.heartrails.com/api/json?method=getLines&area=#{area}")
  p route_names = result['response']['line'].select{ |str| str.include?("JR") or str.include?("新幹線") }
  route_names.each do |route_name|
    Route.create(name: route_name)
  end
  p "怒ってないよ"
  p "This data were added DB"
end
p "done"
