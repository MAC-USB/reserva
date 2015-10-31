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

ActiveRecord::Schema.define(version: 20151031005932) do

  create_table "departamentos", force: :cascade do |t|
    t.string   "nombre"
    t.string   "telefono"
    t.string   "pcontacto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "codigo"
  end

  create_table "horarios", force: :cascade do |t|
    t.integer  "dia"
    t.text     "hora_inicio"
    t.text     "hora_fin"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "reserva_id"
  end

  add_index "horarios", ["reserva_id"], name: "index_horarios_on_reserva_id"

  create_table "materias", force: :cascade do |t|
    t.string   "codigo"
    t.string   "nombre"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "departamento_id"
  end

  add_index "materias", ["departamento_id"], name: "index_materias_on_departamento_id"

  create_table "reservas", force: :cascade do |t|
    t.string   "sala_nombre"
    t.integer  "materia_id"
    t.boolean  "video_beam",     default: false
    t.text     "requerimientos"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "reservas", ["materia_id"], name: "index_reservas_on_materia_id"
  add_index "reservas", ["sala_nombre"], name: "index_reservas_on_sala_nombre"

  create_table "salas", force: :cascade do |t|
    t.string   "nombre"
    t.integer  "capacidad"
    t.text     "ubicacion"
    t.string   "responsable"
    t.boolean  "windows"
    t.boolean  "linux"
    t.boolean  "video_beam"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "softwares", force: :cascade do |t|
    t.string   "nombre"
    t.string   "version"
    t.string   "link"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "sala_nombre"
  end

  add_index "softwares", ["sala_nombre"], name: "index_softwares_on_sala_nombre"

  create_table "usuarios", force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "nombre"
    t.string   "email"
    t.string   "telefono"
    t.string   "carnet"
    t.text     "tokens"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "usuarios", ["confirmation_token"], name: "index_usuarios_on_confirmation_token", unique: true
  add_index "usuarios", ["email"], name: "index_usuarios_on_email"
  add_index "usuarios", ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  add_index "usuarios", ["uid", "provider"], name: "index_usuarios_on_uid_and_provider", unique: true

end
