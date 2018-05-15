class Onestroke < ApplicationRecord
  has_many :onestroke_lines
  has_many :lines, through: :onestroke_lines, source: :line
  has_many :onestroke_stations
  has_many :stations, through: :onestroke_stations, source: :station
end
