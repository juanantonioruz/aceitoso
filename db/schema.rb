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

ActiveRecord::Schema.define(:version => 20120403215226) do

  create_table "fichas", :force => true do |t|
    t.string  "imagen"
    t.text    "descripcion"
    t.text    "contacto"
    t.text    "llegar"
    t.text    "horario"
    t.string  "x"
    t.string  "y"
    t.integer "museo_id"
  end

  add_index "fichas", ["museo_id"], :name => "index_fichas_on_museo_id"

  create_table "genericas", :force => true do |t|
    t.string   "titulo"
    t.text     "descripcion"
    t.string   "imagen"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "genericas_labels", :id => false, :force => true do |t|
    t.integer "generica_id"
    t.integer "label_id"
  end

  add_index "genericas_labels", ["generica_id", "label_id"], :name => "index_genericas_labels_on_generica_id_and_label_id"
  add_index "genericas_labels", ["label_id", "generica_id"], :name => "index_genericas_labels_on_label_id_and_generica_id"

  create_table "labels", :force => true do |t|
    t.string  "nombre"
    t.integer "label_id"
  end

  add_index "labels", ["label_id"], :name => "index_labels_on_label_id"

  create_table "museos", :force => true do |t|
    t.string "nombre"
  end

end
