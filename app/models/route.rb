class Route < ApplicationRecord
    has_many :route_stations
    has_many :stations, through: :route_stations, source: :station
    has_many :lines
    validates :name, uniqueness: true
end
