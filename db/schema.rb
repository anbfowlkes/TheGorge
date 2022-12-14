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

ActiveRecord::Schema[7.0].define(version: 2022_08_23_200329) do
  create_table "boards", force: :cascade do |t|
    t.integer "game"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pieces", force: :cascade do |t|
    t.integer "level"
    t.integer "h_pos"
    t.integer "v_pos"
    t.integer "player"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "player_one_pieces", force: :cascade do |t|
    t.integer "variant"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "player_two_pieces", force: :cascade do |t|
    t.integer "variant"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "username"
    t.integer "skill_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
