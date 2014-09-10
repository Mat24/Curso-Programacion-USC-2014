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

ActiveRecord::Schema.define(version: 20140910164213) do

  create_table "asignaturas", force: true do |t|
    t.string   "nombre"
    t.string   "codigo"
    t.text     "descripcion"
    t.integer  "docente_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "docentes", force: true do |t|
    t.string   "nombre"
    t.integer  "identificacion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reportes", force: true do |t|
    t.integer  "numero_estudiantes"
    t.integer  "docente_id"
    t.text     "comentario"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "asignatura_id"
  end

end
