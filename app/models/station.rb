class Station < ApplicationRecord
    has_many :line_stations
    has_many :lines, through: :line_stations, source: :line
    has_many :route_stations
    has_many :routes, through: :route_stations, source: :route
    has_many :onestroke_stations
    has_many :onestrokes, through: :onestroke_stations, source: :onestroke

    validates :name, uniqueness: true

    def get_latlng
        [self.latitude.to_f, self.longitude.to_f]
      end
end
