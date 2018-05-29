class Line < ApplicationRecord
  module Linestation
    # def next_station
    #   Station.find(self.next)
    # end
    # def prev_station
    #   Station.find(self.previous)
    # end
  end
  has_many :line_stations, extend: Linestation
  has_many :stations, through: :line_stations, source: :station , extend: Linestation
  belongs_to :route
  has_many :onestroke_lines, extend: Linestation
  has_many :onestrokes, through: :onestroke_lines, source: :onestroke, extend: Linestation
  
  def next_station
    Station.find_by(id: self.next)
  end
  def prev_station
    Station.find_by(id: self.previous)
  end
end
