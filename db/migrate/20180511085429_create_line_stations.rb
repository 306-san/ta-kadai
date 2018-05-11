class CreateLineStations < ActiveRecord::Migration[5.2]
  def change
    create_table :line_stations do |t|
      t.references :station, foreign_key: true
      t.references :line, foreign_key: true

      t.timestamps
    end
  end
end
