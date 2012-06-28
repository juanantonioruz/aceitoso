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

ActiveRecord::Schema.define(:version => 20120628014347) do

  create_table "books", :force => true do |t|
    t.string "name"
  end

  create_table "camino_genericas", :force => true do |t|
    t.integer  "camino_id"
    t.integer  "generica_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "caminos", :force => true do |t|
    t.string   "imagen"
    t.text     "descripcion"
    t.string   "nombre"
    t.integer  "entorno_id"
    t.datetime "updated_at"
    t.datetime "created_at"
    t.string   "archivo"
  end

  create_table "caminos_labels", :id => false, :force => true do |t|
    t.integer "camino_id"
    t.integer "label_id"
  end

  add_index "caminos_labels", ["camino_id", "label_id"], :name => "index_caminos_labels_on_camino_id_and_label_id"
  add_index "caminos_labels", ["label_id", "camino_id"], :name => "index_caminos_labels_on_label_id_and_camino_id"

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

  create_table "coordenadas", :force => true do |t|
    t.string  "x"
    t.string  "y"
    t.integer "camino_id"
  end

  add_index "coordenadas", ["camino_id"], :name => "index_coordenadas_on_camino_id"

  create_table "elemento_relacionables", :force => true do |t|
    t.integer  "heir_id"
    t.string   "heir_type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "entornos", :force => true do |t|
    t.integer "museo_id"
  end

  add_index "entornos", ["museo_id"], :name => "index_entornos_on_museo_id"

  create_table "espacios", :force => true do |t|
    t.string   "nombre"
    t.string   "idplano"
    t.text     "descripcion"
    t.string   "imagen"
    t.integer  "museo_id"
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  create_table "espacios_labels", :id => false, :force => true do |t|
    t.integer "espacio_id"
    t.integer "label_id"
  end

  add_index "espacios_labels", ["espacio_id", "label_id"], :name => "index_espacios_labels_on_espacio_id_and_label_id"
  add_index "espacios_labels", ["label_id", "espacio_id"], :name => "index_espacios_labels_on_label_id_and_espacio_id"

  create_table "eventos", :force => true do |t|
    t.string   "titulo"
    t.string   "imagen"
    t.text     "descripcion"
    t.integer  "museo_id"
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  add_index "eventos", ["museo_id"], :name => "index_eventos_on_museo_id"

  create_table "eventos_labels", :id => false, :force => true do |t|
    t.integer "evento_id"
    t.integer "label_id"
  end

  add_index "eventos_labels", ["evento_id", "label_id"], :name => "index_eventos_labels_on_evento_id_and_label_id"
  add_index "eventos_labels", ["label_id", "evento_id"], :name => "index_eventos_labels_on_label_id_and_evento_id"

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
    t.string   "archivo"
  end

  create_table "genericas_labels", :id => false, :force => true do |t|
    t.integer "generica_id"
    t.integer "label_id"
  end

  add_index "genericas_labels", ["generica_id", "label_id"], :name => "index_genericas_labels_on_generica_id_and_label_id"
  add_index "genericas_labels", ["label_id", "generica_id"], :name => "index_genericas_labels_on_label_id_and_generica_id"

  create_table "hito_genericas", :force => true do |t|
    t.integer  "hito_id"
    t.integer  "generica_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "hitos", :force => true do |t|
    t.string   "imagen"
    t.string   "nombre"
    t.text     "descripcion"
    t.string   "x"
    t.string   "y"
    t.integer  "entorno_id"
    t.datetime "updated_at"
    t.datetime "created_at"
    t.integer  "service_id"
    t.string   "archivo"
  end

  add_index "hitos", ["entorno_id"], :name => "index_hitos_on_entorno_id"

  create_table "hitos_labels", :id => false, :force => true do |t|
    t.integer "hito_id"
    t.integer "label_id"
  end

  add_index "hitos_labels", ["hito_id", "label_id"], :name => "index_hitos_labels_on_hito_id_and_label_id"
  add_index "hitos_labels", ["label_id", "hito_id"], :name => "index_hitos_labels_on_label_id_and_hito_id"

  create_table "infos", :force => true do |t|
    t.integer  "generica_id"
    t.integer  "museo_id"
    t.string   "tipo_ri"
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  add_index "infos", ["museo_id"], :name => "index_infos_on_museo_id"

  create_table "labels", :force => true do |t|
    t.string  "nombre"
    t.integer "label_id"
  end

  add_index "labels", ["label_id"], :name => "index_labels_on_label_id"

  create_table "medios", :force => true do |t|
    t.string  "nombre"
    t.string  "descripcion"
    t.boolean "es_audio",    :default => false
    t.integer "museo_id"
  end

  add_index "medios", ["museo_id"], :name => "index_medios_on_museo_id"

  create_table "museos", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "descripcion_ri"
    t.string   "imagen_ri"
    t.string   "nombre_corto"
  end

  create_table "nombre_relacions", :force => true do |t|
    t.string   "nombre1"
    t.string   "nombre2"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pieza_genericas", :force => true do |t|
    t.integer  "pieza_id"
    t.integer  "generica_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "piezas", :force => true do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.string   "imagen"
    t.boolean  "coleccion",   :default => false
    t.integer  "museo_id"
    t.datetime "updated_at"
    t.datetime "created_at"
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

  create_table "premios_labels", :id => false, :force => true do |t|
    t.integer "premio_id"
    t.integer "label_id"
  end

  add_index "premios_labels", ["label_id", "premio_id"], :name => "index_premios_labels_on_label_id_and_premio_id"
  add_index "premios_labels", ["premio_id", "label_id"], :name => "index_premios_labels_on_premio_id_and_label_id"

  create_table "products", :force => true do |t|
    t.integer "heir_id"
    t.string  "heir_type"
    t.string  "title"
  end

  create_table "publicacions", :force => true do |t|
    t.string  "nombre"
    t.string  "url"
    t.text    "descripcion"
    t.integer "museo_id"
  end

  add_index "publicacions", ["museo_id"], :name => "index_publicacions_on_museo_id"

  create_table "publicacions_labels", :id => false, :force => true do |t|
    t.integer "publicacion_id"
    t.integer "label_id"
  end

  add_index "publicacions_labels", ["label_id", "publicacion_id"], :name => "index_publicacions_labels_on_label_id_and_publicacion_id"
  add_index "publicacions_labels", ["publicacion_id", "label_id"], :name => "index_publicacions_labels_on_publicacion_id_and_label_id"

  create_table "relacionables", :force => true do |t|
    t.integer  "heir_id"
    t.string   "heir_type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "relacions", :force => true do |t|
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "sentido_relacion_id"
    t.integer  "origen_id"
    t.integer  "fin_id"
  end

  create_table "sentido_relacions", :force => true do |t|
    t.string   "creciente"
    t.integer  "nombre_relacion_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "services", :force => true do |t|
    t.string "imagen"
    t.string "descripcion"
  end

  create_table "servicios", :force => true do |t|
    t.string  "imagen"
    t.text    "descripcion"
    t.integer "museo_id"
    t.integer "service_id"
  end

  add_index "servicios", ["museo_id"], :name => "index_servicios_on_museo_id"

  create_table "urbanos", :force => true do |t|
    t.string  "imagen"
    t.string  "nombre"
    t.text    "descripcion"
    t.string  "x"
    t.string  "y"
    t.integer "entorno_id"
  end

  add_index "urbanos", ["entorno_id"], :name => "index_urbanos_on_entorno_id"

  create_table "urbanos_labels", :id => false, :force => true do |t|
    t.integer "urbano_id"
    t.integer "label_id"
  end

  add_index "urbanos_labels", ["label_id", "urbano_id"], :name => "index_urbanos_labels_on_label_id_and_urbano_id"
  add_index "urbanos_labels", ["urbano_id", "label_id"], :name => "index_urbanos_labels_on_urbano_id_and_label_id"

  create_table "varios", :force => true do |t|
    t.string  "nombre"
    t.text    "descripcion"
    t.integer "museo_id"
  end

  add_index "varios", ["museo_id"], :name => "index_varios_on_museo_id"

end
