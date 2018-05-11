class Line < ApplicationRecord
    has_many :line_stations
    has_many :station, through: :line_stations, source: :station
end
