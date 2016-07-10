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

ActiveRecord::Schema.define(version: 20160710222938) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boards", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "url"
    t.boolean  "closed"
    t.string   "trello_id"
    t.integer  "organization_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["organization_id"], name: "index_boards_on_organization_id", using: :btree
  end

  create_table "cards", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "due"
    t.string   "url"
    t.boolean  "closed"
    t.string   "trello_id"
    t.string   "short_trello_id"
    t.string   "badges"
    t.text     "card_labels",     default: [],              array: true
    t.integer  "board_id"
    t.integer  "list_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["board_id"], name: "index_cards_on_board_id", using: :btree
    t.index ["list_id"], name: "index_cards_on_list_id", using: :btree
  end

  create_table "lists", force: :cascade do |t|
    t.string   "name"
    t.boolean  "closed"
    t.integer  "board_id"
    t.string   "trello_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id"], name: "index_lists_on_board_id", using: :btree
  end

  create_table "organizations", force: :cascade do |t|
    t.string   "description"
    t.string   "display_name"
    t.string   "name"
    t.string   "url"
    t.string   "trello_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "user_boards", force: :cascade do |t|
    t.integer "user_id"
    t.integer "board_id"
    t.index ["board_id"], name: "index_user_boards_on_board_id", using: :btree
    t.index ["user_id"], name: "index_user_boards_on_user_id", using: :btree
  end

  create_table "user_cards", force: :cascade do |t|
    t.integer "user_id"
    t.integer "card_id"
    t.index ["card_id"], name: "index_user_cards_on_card_id", using: :btree
    t.index ["user_id"], name: "index_user_cards_on_user_id", using: :btree
  end

  create_table "user_organizations", force: :cascade do |t|
    t.integer "user_id"
    t.integer "organization_id"
    t.index ["organization_id"], name: "index_user_organizations_on_organization_id", using: :btree
    t.index ["user_id"], name: "index_user_organizations_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "uid"
    t.string   "email"
    t.string   "slack_username"
    t.string   "trello_username"
    t.string   "token"
    t.string   "secret"
    t.string   "name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "webhooks", force: :cascade do |t|
    t.boolean  "active"
    t.string   "description"
    t.string   "callback_url"
    t.string   "trello_id"
    t.string   "trello_id_model"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "trello_model_type"
  end

end
