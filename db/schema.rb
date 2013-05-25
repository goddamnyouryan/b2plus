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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130525195343) do

  create_table "media", :force => true do |t|
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.integer  "imageable_id"
    t.string   "type"
    t.string   "imageable_type"
  end

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.text     "body"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.string   "title"
    t.integer  "order",      :default => 0, :null => false
  end

  create_table "works", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "order"
    t.string   "mp4"
    t.string   "ogg"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
