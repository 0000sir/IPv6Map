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

ActiveRecord::Schema.define(version: 2019_04_17_131936) do

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.string "domain"
    t.boolean "ipv6"
    t.boolean "httpv6"
    t.boolean "httpsv6"
    t.boolean "http2v6"
    t.boolean "ipv4"
    t.boolean "httpv4"
    t.boolean "httpsv4"
    t.boolean "http2v4"
    t.integer "score"
    t.float "latitude"
    t.float "longitude"
    t.string "address"
    t.string "province"
    t.string "city"
    t.string "area"
    t.string "telephone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
