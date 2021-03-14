# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_14_160724) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "avatar_items", force: :cascade do |t|
    t.bigint "avatar_id", null: false
    t.bigint "item_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "choosen", default: false
    t.index ["avatar_id"], name: "index_avatar_items_on_avatar_id"
    t.index ["item_id"], name: "index_avatar_items_on_item_id"
  end

  create_table "avatars", force: :cascade do |t|
    t.string "gender"
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "wallet"
    t.index ["user_id"], name: "index_avatars_on_user_id"
  end

  create_table "boards", force: :cascade do |t|
    t.bigint "avatar_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["avatar_id"], name: "index_boards_on_avatar_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
  end

  create_table "games", force: :cascade do |t|
    t.string "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
  end

  create_table "items", force: :cascade do |t|
    t.integer "price"
    t.string "name"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "category_id", null: false
    t.index ["category_id"], name: "index_items_on_category_id"
  end

  create_table "participations", force: :cascade do |t|
    t.bigint "game_id", null: false
    t.bigint "board_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "finished_in"
    t.index ["board_id"], name: "index_participations_on_board_id"
    t.index ["game_id"], name: "index_participations_on_game_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "avatar_items", "avatars"
  add_foreign_key "avatar_items", "items"
  add_foreign_key "avatars", "users"
  add_foreign_key "boards", "avatars"
  add_foreign_key "items", "categories"
  add_foreign_key "participations", "boards"
  add_foreign_key "participations", "games"
end
