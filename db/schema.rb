# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_05_15_023221) do

  create_table "line_stations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "station_id"
    t.bigint "line_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["line_id"], name: "index_line_stations_on_line_id"
    t.index ["station_id"], name: "index_line_stations_on_station_id"
  end

  create_table "lines", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "previous"
    t.integer "next"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "route_id"
  end

  create_table "onestroke_lines", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "onestroke_id"
    t.bigint "line_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["line_id"], name: "index_onestroke_lines_on_line_id"
    t.index ["onestroke_id"], name: "index_onestroke_lines_on_onestroke_id"
  end

  create_table "onestroke_stations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "onestroke_id"
    t.bigint "station_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["onestroke_id"], name: "index_onestroke_stations_on_onestroke_id"
    t.index ["station_id"], name: "index_onestroke_stations_on_station_id"
  end

  create_table "onestrokes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "route_stations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "route_id"
    t.bigint "station_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["route_id"], name: "index_route_stations_on_route_id"
    t.index ["station_id"], name: "index_route_stations_on_station_id"
  end

  create_table "routes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.decimal "longitude", precision: 11, scale: 8, null: false
    t.decimal "latitude", precision: 11, scale: 8, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "line_stations", "lines"
  add_foreign_key "line_stations", "stations"
  add_foreign_key "onestroke_lines", "lines"
  add_foreign_key "onestroke_lines", "onestrokes"
  add_foreign_key "onestroke_stations", "onestrokes"
  add_foreign_key "onestroke_stations", "stations"
  add_foreign_key "route_stations", "routes"
  add_foreign_key "route_stations", "stations"
end
