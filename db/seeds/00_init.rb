#  使いまわすライブラリー集約
require 'net/http'
require 'uri'
require 'json'

def get_api(url)
  uri = URI.parse(URI.encode(url))
  json = Net::HTTP.get(uri) #NET::HTTPを利用してAPIを叩く
  JSON.parse(json) #返ってきたjsonデータをrubyの配列に変換
end