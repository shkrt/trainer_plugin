# encoding: UTF-8
# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_160_204_133_621) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'ahoy_events', id: :uuid, default: nil, force: :cascade do |t|
    t.uuid     'visit_id'
    t.integer  'user_id'
    t.string   'name'
    t.json     'properties'
    t.datetime 'time'
  end

  add_index 'ahoy_events', ['time'], name: 'index_ahoy_events_on_time', using: :btree
  add_index 'ahoy_events', ['user_id'], name: 'index_ahoy_events_on_user_id', using: :btree
  add_index 'ahoy_events', ['visit_id'], name: 'index_ahoy_events_on_visit_id', using: :btree

  create_table 'users', force: :cascade do |t|
    t.string   'email'
    t.string   'password_digest'
    t.datetime 'created_at',      null: false
    t.datetime 'updated_at',      null: false
  end

  create_table 'visits', id: :uuid, default: nil, force: :cascade do |t|
    t.uuid     'visitor_id'
    t.string   'ip'
    t.text     'user_agent'
    t.text     'referrer'
    t.text     'landing_page'
    t.integer  'user_id'
    t.string   'referring_domain'
    t.string   'search_keyword'
    t.string   'browser'
    t.string   'os'
    t.string   'device_type'
    t.integer  'screen_height'
    t.integer  'screen_width'
    t.string   'country'
    t.string   'region'
    t.string   'city'
    t.string   'postal_code'
    t.decimal  'latitude'
    t.decimal  'longitude'
    t.string   'utm_source'
    t.string   'utm_medium'
    t.string   'utm_term'
    t.string   'utm_content'
    t.string   'utm_campaign'
    t.datetime 'started_at'
  end

  add_index 'visits', ['user_id'], name: 'index_visits_on_user_id', using: :btree
end
