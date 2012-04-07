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

ActiveRecord::Schema.define(:version => 20120407154327) do

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "espacios", :force => true do |t|
    t.string  "nombre"
    t.string  "idplano"
    t.text    "descripcion"
    t.string  "imagen"
    t.integer "museo_id"
  end

  create_table "espacios_labels", :id => false, :force => true do |t|
    t.integer "espacio_id"
    t.integer "label_id"
  end

  add_index "espacios_labels", ["espacio_id", "label_id"], :name => "index_espacios_labels_on_espacio_id_and_label_id"
  add_index "espacios_labels", ["label_id", "espacio_id"], :name => "index_espacios_labels_on_label_id_and_espacio_id"

  create_table "eventos", :force => true do |t|
    t.string  "titulo"
    t.string  "imagen"
    t.text    "descripcion"
    t.integer "museo_id"
  end

  add_index "eventos", ["museo_id"], :name => "index_eventos_on_museo_id"

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

  create_table "fichas_labels", :id => false, :force => true do |t|
    t.integer "ficha_id"
    t.integer "label_id"
  end

  add_index "fichas_labels", ["ficha_id", "label_id"], :name => "index_fichas_labels_on_ficha_id_and_label_id"
  add_index "fichas_labels", ["label_id", "ficha_id"], :name => "index_fichas_labels_on_label_id_and_ficha_id"

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

  create_table "infos", :force => true do |t|
    t.string  "url"
    t.integer "museo_id"
  end

  add_index "infos", ["museo_id"], :name => "index_infos_on_museo_id"

  create_table "labels", :force => true do |t|
    t.string  "nombre"
    t.integer "label_id"
  end

  add_index "labels", ["label_id"], :name => "index_labels_on_label_id"

  create_table "museos", :force => true do |t|
    t.string "nombre"
  end

  create_table "piezas", :force => true do |t|
    t.string  "nombre"
    t.text    "descripcion"
    t.string  "imagen"
    t.boolean "coleccion",   :default => false
    t.integer "museo_id"
  end

  add_index "piezas", ["museo_id"], :name => "index_piezas_on_museo_id"

  create_table "piezas_labels", :id => false, :force => true do |t|
    t.integer "pieza_id"
    t.integer "label_id"
  end

  add_index "piezas_labels", ["label_id", "pieza_id"], :name => "index_piezas_labels_on_label_id_and_pieza_id"
  add_index "piezas_labels", ["pieza_id", "label_id"], :name => "index_piezas_labels_on_pieza_id_and_label_id"

  create_table "premios", :force => true do |t|
    t.string  "nombre"
    t.string  "url"
    t.text    "descripcion"
    t.integer "museo_id"
  end

  add_index "premios", ["museo_id"], :name => "index_premios_on_museo_id"

  create_table "publicacions", :force => true do |t|
    t.string  "nombre"
    t.string  "url"
    t.text    "descripcion"
    t.integer "museo_id"
  end

  add_index "publicacions", ["museo_id"], :name => "index_publicacions_on_museo_id"

end
