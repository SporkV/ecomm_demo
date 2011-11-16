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

ActiveRecord::Schema.define(:version => 20111115235258) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "country"
    t.string   "postal_code"
    t.string   "email"
    t.integer  "province_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "line_items", :force => true do |t|
    t.integer  "quantity"
    t.decimal  "price",      :precision => 8, :scale => 2
    t.integer  "product_id"
    t.integer  "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", :force => true do |t|
    t.string   "status"
    t.decimal  "total",                :precision => 8, :scale => 2
    t.decimal  "subtotal",             :precision => 8, :scale => 2
    t.decimal  "pst",                  :precision => 8, :scale => 2
    t.decimal  "gst",                  :precision => 8, :scale => 2
    t.decimal  "hst",                  :precision => 8, :scale => 2
    t.string   "payment_processor"
    t.string   "processor_identifier"
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.decimal  "price",          :precision => 8, :scale => 2
    t.integer  "stock_quantity"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "provinces", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.decimal  "pst",           :precision => 8, :scale => 2
    t.decimal  "gst",           :precision => 8, :scale => 2
    t.decimal  "hst",           :precision => 8, :scale => 2
    t.boolean  "home_province"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
