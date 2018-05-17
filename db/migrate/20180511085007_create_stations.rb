class CreateStations < ActiveRecord::Migration[5.2]
  def change
    create_table :stations do |t|
      t.string :name, null: false
      t.decimal :longitude, precision: 11, scale: 8, null: false
      t.decimal :latitude, precision: 11, scale: 8, null: false

      t.timestamps
    end
  end
end
