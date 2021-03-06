# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20131216003645) do

  create_table "books", force: true do |t|
    t.integer  "user_id"
    t.string   "book_names"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "movies", force: true do |t|
    t.integer  "user_id"
    t.string   "movie_names"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "musics", force: true do |t|
    t.integer  "user_id"
    t.string   "artists"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pending_friend_requests", force: true do |t|
    t.integer  "from_user_id"
    t.integer  "to_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "time_posted"
    t.string   "status"
    t.integer  "on_wall_of_user"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_friend_relations", force: true do |t|
    t.integer  "user_id1"
    t.integer  "user_id2"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_infos", force: true do |t|
    t.integer  "user_id"
    t.string   "hometown"
    t.date     "birthday"
    t.string   "school"
    t.string   "job"
    t.string   "quotes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
