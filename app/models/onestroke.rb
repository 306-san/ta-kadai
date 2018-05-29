class Onestroke < ApplicationRecord
  has_many :onestroke_lines, dependent: :delete_all
  has_many :lines, through: :onestroke_lines, source: :line
  has_many :onestroke_stations, dependent: :delete_all
  has_many :stations, through: :onestroke_stations, source: :station
end
