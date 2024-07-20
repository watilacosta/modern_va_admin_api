# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_07_20_140715) do
  create_table "airports", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "icao", null: false
    t.string "name"
    t.string "latitude", null: false
    t.string "longitude", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pireps", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "user"
    t.string "pass"
    t.string "auth"
    t.decimal "version", precision: 10
    t.string "aircraft"
    t.string "atcmodel"
    t.string "atc_identifier"
    t.string "atc_flight_number"
    t.string "atc_airline"
    t.string "atc_type"
    t.decimal "origin_latitude", precision: 10
    t.decimal "origin_longitude", precision: 10
    t.decimal "destination_latitude", precision: 10
    t.decimal "destination_longitude", precision: 10
    t.decimal "landing_latitude", precision: 10
    t.decimal "landing_longitude", precision: 10
    t.string "direct_nm"
    t.string "actual_nm"
    t.string "date_short"
    t.string "date_stamp"
    t.string "timeout"
    t.string "timeoff"
    t.string "timeon"
    t.string "timein"
    t.string "fstime_out"
    t.string "fstime_off"
    t.string "fstime_on"
    t.string "fstime_in"
    t.string "block_time"
    t.decimal "fuel_start", precision: 10
    t.decimal "fuel_stop", precision: 10
    t.decimal "fuel_diff", precision: 10
    t.string "time_of_day"
    t.string "landing_flight_rules"
    t.decimal "landing_speed", precision: 10
    t.decimal "landing_rate", precision: 10
    t.decimal "takeoff_weight", precision: 10
    t.decimal "landing_weight", precision: 10
    t.text "pirep_flight_comments"
    t.string "pause"
    t.string "slew"
    t.string "stall"
    t.string "over_speed"
    t.string "speed_below_10k"
    t.string "sim_rate"
    t.string "refuel"
    t.string "crashed"
    t.string "no_fuel"
    t.string "warp_in_nm"
    t.string "fuel_jettison"
    t.string "takeoff_flight_rule"
    t.string "takeoff_wind"
    t.string "landing_wind"
    t.string "payload"
    t.string "fs_version"
    t.string "oew"
    t.string "zfw"
    t.string "rollout"
    t.string "block_fuel"
    t.string "enroute_fuel"
    t.string "taxi_fuel"
    t.string "gmax"
    t.string "gmin"
    t.string "takeoff_headingwind"
    t.string "takeoff_crosswind"
    t.string "landing_headingwind"
    t.string "landing_crosswind"
    t.string "average_enroute_wind"
    t.string "takeoff_flaps"
    t.string "landing_flaps"
    t.string "max_taxi_speed_takeoff"
    t.string "max_taxi_speed_landing"
    t.string "takeoff_airspeed"
    t.string "true_landing_heading"
    t.string "multifpm"
    t.string "fpm_array"
    t.string "fpm_string"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
