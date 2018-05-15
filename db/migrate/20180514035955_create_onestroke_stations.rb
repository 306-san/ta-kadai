class CreateOnestrokeStations < ActiveRecord::Migration[5.2]
  def change
    create_table :onestroke_stations do |t|
      t.references :onestroke, foreign_key: true
      t.references :station, foreign_key: true

      t.timestamps
    end
  end
end
