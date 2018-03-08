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

ActiveRecord::Schema.define(version: 20180308135129) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "folders_lists", force: :cascade do |t|
    t.string "guid", null: false
    t.string "url_hash"
    t.string "folders"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.index ["guid"], name: "index_folders_lists_on_guid", unique: true
    t.index ["url_hash"], name: "index_folders_lists_on_url_hash", unique: true
  end

end
