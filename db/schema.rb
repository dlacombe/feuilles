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

ActiveRecord::Schema.define(:version => 20120827154411) do

  create_table "clients", :force => true do |t|
    t.string   "code"
    t.string   "nom"
    t.string   "adresse"
    t.string   "ville"
    t.string   "province"
    t.string   "pays"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.string   "code_postal"
    t.string   "telephone"
    t.string   "email"
    t.decimal  "taux_horaire", :precision => 8, :scale => 2
  end

  create_table "feuilles", :force => true do |t|
    t.integer  "client_id"
    t.datetime "debut"
    t.datetime "fin"
    t.text     "travail_effectuer"
    t.float    "surtemps",          :default => 0.0
    t.float    "voyagement",        :default => 0.0
    t.float    "nc",                :default => 0.0
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  create_table "gls", :force => true do |t|
    t.date     "date"
    t.string   "type"
    t.text     "nom"
    t.integer  "no_gl"
    t.float    "debit"
    t.float    "credit"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "utilisateurs", :force => true do |t|
    t.string   "nom"
    t.string   "mot_de_passe"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

end
