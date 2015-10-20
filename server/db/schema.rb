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

ActiveRecord::Schema.define(version: 20151020141642) do

  create_table "departamentos", force: :cascade do |t|
    t.string   "nombre"
    t.string   "telefono"
    t.string   "correo"
    t.string   "pcontacto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "materias", force: :cascade do |t|
    t.string   "codigo"
    t.string   "nombre"
    t.string   "departamento"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "reservas", force: :cascade do |t|
    t.string   "sala_nombre"
    t.integer  "materia_id"
    t.boolean  "video_beam"
    t.text     "software"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
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

end
