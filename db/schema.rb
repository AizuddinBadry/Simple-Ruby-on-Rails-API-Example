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

ActiveRecord::Schema.define(version: 20170918170020) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "listings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "category"
    t.integer "price"
    t.string "state"
    t.string "address"
    t.string "city"
    t.string "zipcode"
    t.string "images"
    t.string "description"
    t.string "phone"
    t.string "website"
    t.string "email"
    t.integer "user_id"
    t.string "images2"
    t.string "images3"
    t.string "images4"
    t.string "rate"
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "images"
    t.string "category"
    t.string "status_by_hobbez"
    t.string "status_by_customer"
    t.bigint "customer_id"
    t.bigint "hobbez_id"
    t.string "references"
    t.string "description"
    t.string "duration"
    t.string "duration_type"
  end

  create_table "reviews", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "email"
    t.string "review"
    t.boolean "approved"
    t.bigint "listing_id"
  end

  create_table "task_completeds", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "listing_id"
    t.bigint "upvote"
    t.bigint "downvote"
  end

  create_table "task_not_completeds", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "listing_id"
    t.string "description"
  end

  create_table "transactions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "email"
    t.bigint "amount"
    t.string "status"
    t.string "bill_id"
    t.string "bill_url"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "email"
    t.string "password"
    t.string "twitter"
    t.string "facebook"
    t.string "google"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "token"
    t.string "picture"
    t.string "banks"
    t.bigint "account_numbers"
  end

end
