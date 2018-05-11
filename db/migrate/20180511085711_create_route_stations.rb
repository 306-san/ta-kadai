class CreateRouteStations < ActiveRecord::Migration[5.2]
  def change
    create_table :route_stations do |t|
      t.references :route, foreign_key: true
      t.references :station, foreign_key: true

      t.timestamps
    end
  end
end
