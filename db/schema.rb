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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130323204405) do

  create_table "responses", :force => true do |t|
    t.integer  "quality"
    t.string   "sayit"
    t.integer  "next_state"
    t.integer  "current_state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "next_say"
  end

  create_table "states", :force => true do |t|
    t.string   "name"
    t.string   "toonsay"
    t.integer  "best_resp"
    t.integer  "good_resp"
    t.integer  "bad_resp"
    t.integer  "worst_resp"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
