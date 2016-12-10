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

ActiveRecord::Schema.define(version: 20161209192945) do

  create_table "frameworks", force: true do |t|
    t.string "framework", limit: nil
  end

  create_table "frameworks_users", force: true do |t|
    t.integer "framework_id"
    t.integer "user_id"
  end

  create_table "users", force: true do |t|
    t.string  "username",     limit: nil
    t.string  "enc_password", limit: nil
    t.string  "access_token", limit: nil
    t.string  "profile",      limit: nil
    t.string  "skills",       limit: nil
    t.string  "email",        limit: nil
    t.string  "name",         limit: nil
    t.string  "mobile",       limit: nil
    t.string  "avatar",       limit: nil
    t.integer "age"
    t.string  "city",         limit: nil
    t.string  "linkedin",     limit: nil
    t.string  "github",       limit: nil
    t.string  "skype",        limit: nil
    t.string  "vk",           limit: nil
    t.string  "twitter",      limit: nil
    t.string  "facebook",     limit: nil
    t.string  "country"
    t.string  "phone"
  end

end
