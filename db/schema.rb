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

ActiveRecord::Schema.define(version: 20160415181328) do

  create_table "amigos", id: false, force: :cascade do |t|
    t.integer "iduser",  limit: 4,             null: false
    t.integer "idamigo", limit: 4,             null: false
    t.integer "estado",  limit: 4, default: 0, null: false
  end

  create_table "arrows", force: :cascade do |t|
    t.integer  "score_id",   limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "value",      limit: 4
    t.string   "arrow",      limit: 255
    t.integer  "position",   limit: 4
  end

  create_table "headers", force: :cascade do |t|
    t.string   "title",              limit: 255
    t.text     "description",        limit: 65535
    t.text     "used_at",            limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name",    limit: 255
    t.string   "photo_content_type", limit: 255
    t.integer  "photo_file_size",    limit: 4
    t.datetime "photo_updated_at"
  end

  create_table "material", primary_key: "usuario", force: :cascade do |t|
    t.string "palas",     limit: 200
    t.string "potencia",  limit: 200
    t.string "cuerpo",    limit: 200
    t.string "tamano",    limit: 200
    t.string "flechas",   limit: 200
    t.string "visor",     limit: 200
    t.string "boton",     limit: 200
    t.string "fistmelle", limit: 200
    t.string "cuerda",    limit: 200
  end

  create_table "modalidades", force: :cascade do |t|
    t.string "nombre", limit: 50, null: false
  end

  create_table "rondas", force: :cascade do |t|
    t.integer "sesion",    limit: 4,               null: false
    t.integer "ronda",     limit: 4,               null: false
    t.integer "distancia", limit: 4,               null: false
    t.string  "flecha1",   limit: 2, default: "M"
    t.string  "flecha2",   limit: 2, default: "M"
    t.string  "flecha3",   limit: 2, default: "M"
  end

  create_table "score_types", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.integer  "arrows",      limit: 4
    t.integer  "distance_1",  limit: 4
    t.integer  "distance_2",  limit: 4
    t.integer  "distance_3",  limit: 4
    t.integer  "distance_4",  limit: 4
    t.boolean  "published"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "target_1",    limit: 255
    t.string   "target_2",    limit: 255
    t.string   "target_3",    limit: 255
    t.string   "target_4",    limit: 255
    t.integer  "old_type_id", limit: 4
  end

  create_table "scores", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.integer  "score_type_id", limit: 4
    t.integer  "user_id",       limit: 4
    t.integer  "state",         limit: 4
    t.integer  "published",     limit: 4
    t.integer  "points",        limit: 4
    t.float    "average",       limit: 24
    t.integer  "x_count",       limit: 4
    t.integer  "ten_count",     limit: 4
    t.integer  "nine_count",    limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "sesiones", force: :cascade do |t|
    t.integer "usuario",     limit: 4,                 null: false
    t.string  "modalidad",   limit: 25,                null: false
    t.string  "fecha",       limit: 15,                null: false
    t.string  "hora",        limit: 15,                null: false
    t.integer "puntuacion",  limit: 4,                 null: false
    t.integer "tipotirada",  limit: 4,                 null: false
    t.integer "public",      limit: 4,     default: 0, null: false
    t.text    "comentarios", limit: 65535
    t.string  "nombre",      limit: 100
    t.string  "media",       limit: 10
    t.integer "competicion", limit: 4,     default: 0, null: false
    t.integer "grafica",     limit: 4,     default: 1, null: false
    t.integer "enlazado",    limit: 4,     default: 0, null: false
  end

  create_table "tipotirada", force: :cascade do |t|
    t.string  "nombre",     limit: 300, null: false
    t.integer "dist1",      limit: 4,   null: false
    t.integer "dist2",      limit: 4
    t.integer "dist3",      limit: 4
    t.integer "dist4",      limit: 4
    t.string  "dia1",       limit: 50,  null: false
    t.string  "dia2",       limit: 50
    t.string  "dia3",       limit: 50
    t.string  "dia4",       limit: 50
    t.integer "numflechas", limit: 4,   null: false
  end

  create_table "tolk_locales", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tolk_locales", ["name"], name: "index_tolk_locales_on_name", unique: true, using: :btree

  create_table "tolk_phrases", force: :cascade do |t|
    t.text     "key",        limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tolk_translations", force: :cascade do |t|
    t.integer  "phrase_id",       limit: 4
    t.integer  "locale_id",       limit: 4
    t.text     "text",            limit: 65535
    t.text     "previous_text",   limit: 65535
    t.boolean  "primary_updated",               default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tolk_translations", ["phrase_id", "locale_id"], name: "index_tolk_translations_on_phrase_id_and_locale_id", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.integer  "old_id",                 limit: 8
    t.string   "name",                   limit: 255
    t.date     "birth_date"
    t.string   "sex",                    limit: 255
    t.string   "discipline",             limit: 255
    t.string   "license",                limit: 255
    t.string   "photo",                  limit: 255
    t.string   "state",                  limit: 255
    t.integer  "admin",                  limit: 4
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "roles",                  limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "usuarios", force: :cascade do |t|
    t.string  "mail",        limit: 100,                          null: false
    t.string  "keyword",     limit: 50,                           null: false
    t.string  "nombre",      limit: 100,                          null: false
    t.string  "apellidos",   limit: 200
    t.string  "fechanac",    limit: 25
    t.string  "sexo",        limit: 10
    t.string  "modalidad",   limit: 25
    t.string  "nacional",    limit: 25
    t.string  "regional",    limit: 25
    t.integer "activo",      limit: 4,   default: 0,              null: false
    t.string  "foto",        limit: 100, default: "droide.png",   null: false
    t.string  "tuestado",    limit: 100, default: ""
    t.string  "fechamod",    limit: 25,  default: "1900-1-1-0-0", null: false
    t.integer "recibirmail", limit: 4,   default: 1,              null: false
    t.integer "admin",       limit: 4,   default: 0,              null: false
  end

end
