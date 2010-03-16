# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100315173134) do

  create_table "brands", :force => true do |t|
    t.string   "title",                                :null => false
    t.text     "body"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.boolean  "public",             :default => true, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "permalink",                            :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "title"
    t.string   "permalink",                    :null => false
    t.integer  "position",   :default => 0,    :null => false
    t.boolean  "public",     :default => true, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_availabilities", :force => true do |t|
    t.integer  "item_id"
    t.integer  "size",       :default => 0, :null => false
    t.integer  "quantity",   :default => 1, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_photos", :force => true do |t|
    t.integer  "item_id",                            :null => false
    t.string   "image_file_name",    :default => "", :null => false
    t.string   "image_content_type", :default => "", :null => false
    t.integer  "image_file_size",    :default => 0,  :null => false
    t.integer  "position",           :default => 0,  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", :force => true do |t|
    t.integer  "category_id"
    t.integer  "brand_id"
    t.string   "title",              :default => "",   :null => false
    t.text     "body"
    t.float    "price",              :default => 0.0,  :null => false
    t.float    "price_old",          :default => 0.0,  :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.integer  "status",             :default => 0,    :null => false
    t.integer  "gender",             :default => 1,    :null => false
    t.boolean  "public",             :default => true, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "color",              :default => 0,    :null => false
    t.string   "permalink",                            :null => false
  end

  create_table "order_items", :force => true do |t|
    t.integer  "order_id",             :null => false
    t.integer  "item_id",              :null => false
    t.integer  "item_availability_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", :force => true do |t|
    t.integer  "shipping_type", :default => 0,         :null => false
    t.integer  "payment_type",  :default => 0,         :null => false
    t.string   "state",         :default => "pending", :null => false
    t.string   "code",          :default => "",        :null => false
    t.string   "user_name",     :default => "",        :null => false
    t.string   "email",         :default => "",        :null => false
    t.string   "phone",         :default => "",        :null => false
    t.string   "city",          :default => "",        :null => false
    t.text     "address",                              :null => false
    t.text     "comments",                             :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", :force => true do |t|
    t.string   "title",      :default => "",   :null => false
    t.text     "body"
    t.integer  "position",   :default => 0,    :null => false
    t.boolean  "public",     :default => true, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "taggable_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

end
