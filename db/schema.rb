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

ActiveRecord::Schema.define(version: 20160126212727) do

  create_table "appointments", force: :cascade do |t|
    t.integer  "company_id",                limit: 4
    t.integer  "branch_id",                 limit: 4
    t.integer  "professional_id",           limit: 4
    t.integer  "client_id",                 limit: 4
    t.integer  "appointment_id",            limit: 4
    t.datetime "date_time",                                               null: false
    t.string   "status",                    limit: 255
    t.string   "photo",                     limit: 255
    t.string   "task_type",                 limit: 50
    t.text     "task_note",                 limit: 65535
    t.float    "total_project_price",       limit: 24
    t.float    "task_payment",              limit: 24
    t.float    "professional_fee",          limit: 24
    t.float    "remaining_project_payment", limit: 24
    t.boolean  "needs_folloup",                           default: false
    t.float    "created_by§",               limit: 24
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
  end

  add_index "appointments", ["appointment_id"], name: "index_appointments_on_appointment_id", using: :btree
  add_index "appointments", ["branch_id"], name: "index_appointments_on_branch_id", using: :btree
  add_index "appointments", ["client_id"], name: "index_appointments_on_client_id", using: :btree
  add_index "appointments", ["company_id"], name: "index_appointments_on_company_id", using: :btree
  add_index "appointments", ["date_time"], name: "index_appointments_on_date_time", using: :btree
  add_index "appointments", ["professional_id"], name: "index_appointments_on_professional_id", using: :btree

  create_table "branches", force: :cascade do |t|
    t.integer  "company_id",      limit: 4
    t.string   "id_code",         limit: 25
    t.string   "name",            limit: 50,                  null: false
    t.string   "email",           limit: 255, default: "@",   null: false
    t.boolean  "pass_active",                 default: false
    t.boolean  "acc_active",                  default: false
    t.string   "password_digest", limit: 255
    t.datetime "last_in"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "branches", ["company_id"], name: "index_branches_on_company_id", using: :btree
  add_index "branches", ["email"], name: "index_branches_on_email", using: :btree

  create_table "branches_professionals", id: false, force: :cascade do |t|
    t.integer "branch_id",       limit: 4
    t.integer "professional_id", limit: 4
  end

  add_index "branches_professionals", ["branch_id", "professional_id"], name: "index_branches_professionals_on_branch_id_and_professional_id", using: :btree

  create_table "clients", force: :cascade do |t|
    t.integer  "company_id", limit: 4
    t.integer  "branch_id",  limit: 4
    t.string   "id_code",    limit: 25
    t.string   "first_name", limit: 50,                null: false
    t.string   "last_name",  limit: 50,                null: false
    t.date     "dob",                                  null: false
    t.string   "email",      limit: 255, default: "@"
    t.string   "photo",      limit: 255
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "clients", ["branch_id"], name: "index_clients_on_branch_id", using: :btree
  add_index "clients", ["company_id"], name: "index_clients_on_company_id", using: :btree
  add_index "clients", ["dob"], name: "index_clients_on_dob", using: :btree
  add_index "clients", ["email"], name: "index_clients_on_email", using: :btree
  add_index "clients", ["first_name"], name: "index_clients_on_first_name", using: :btree
  add_index "clients", ["last_name"], name: "index_clients_on_last_name", using: :btree

  create_table "clients_professionals", id: false, force: :cascade do |t|
    t.integer "client_id",       limit: 4
    t.integer "professional_id", limit: 4
  end

  add_index "clients_professionals", ["client_id", "professional_id"], name: "index_clients_professionals_on_client_id_and_professional_id", using: :btree

  create_table "companies", force: :cascade do |t|
    t.string   "id_code",         limit: 25
    t.string   "name",            limit: 50,                  null: false
    t.string   "email",           limit: 255, default: "@",   null: false
    t.boolean  "head_quarter",                default: false
    t.boolean  "branch",                      default: false
    t.boolean  "pass_active",                 default: false
    t.boolean  "acc_active",                  default: false
    t.string   "password_digest", limit: 255
    t.datetime "last_in"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "companies", ["email"], name: "index_companies_on_email", using: :btree
  add_index "companies", ["head_quarter"], name: "index_companies_on_head_quarter", using: :btree
  add_index "companies", ["name"], name: "index_companies_on_name", using: :btree

  create_table "company_appointments", force: :cascade do |t|
    t.integer  "company_id",                  limit: 4
    t.integer  "branch_id",                   limit: 4
    t.integer  "professional_id",             limit: 4
    t.integer  "client_id",                   limit: 4
    t.integer  "professional_appointment_id", limit: 4
    t.datetime "date_time",                                                 null: false
    t.string   "status",                      limit: 255
    t.string   "photo",                       limit: 255
    t.string   "task_type",                   limit: 50
    t.text     "task_note",                   limit: 65535
    t.float    "total_project_price",         limit: 24
    t.float    "task_payment",                limit: 24
    t.float    "professional_fee",            limit: 24
    t.float    "remaining_project_payment",   limit: 24
    t.boolean  "needs_folloup",                             default: false
    t.datetime "created_at",                                                null: false
    t.datetime "updated_at",                                                null: false
  end

  add_index "company_appointments", ["branch_id"], name: "index_company_appointments_on_branch_id", using: :btree
  add_index "company_appointments", ["client_id"], name: "index_company_appointments_on_client_id", using: :btree
  add_index "company_appointments", ["company_id"], name: "index_company_appointments_on_company_id", using: :btree
  add_index "company_appointments", ["date_time"], name: "index_company_appointments_on_date_time", using: :btree
  add_index "company_appointments", ["professional_appointment_id"], name: "index_company_appointments_on_professional_appointment_id", using: :btree
  add_index "company_appointments", ["professional_id"], name: "index_company_appointments_on_professional_id", using: :btree

  create_table "contact_details", force: :cascade do |t|
    t.integer  "company_id",      limit: 4
    t.integer  "branch_id",       limit: 4
    t.integer  "professional_id", limit: 4
    t.integer  "client_id",       limit: 4
    t.string   "address_type",    limit: 255
    t.string   "address",         limit: 255
    t.string   "city",            limit: 255
    t.string   "state",           limit: 255
    t.string   "country",         limit: 255
    t.string   "tel",             limit: 255
    t.boolean  "validated",                   default: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "contact_details", ["branch_id"], name: "index_contact_details_on_branch_id", using: :btree
  add_index "contact_details", ["client_id"], name: "index_contact_details_on_client_id", using: :btree
  add_index "contact_details", ["company_id"], name: "index_contact_details_on_company_id", using: :btree
  add_index "contact_details", ["professional_id"], name: "index_contact_details_on_professional_id", using: :btree

  create_table "employments", force: :cascade do |t|
    t.integer  "company_id",      limit: 4
    t.integer  "professional_id", limit: 4
    t.boolean  "validated",                 default: false
    t.datetime "absent_on"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  add_index "employments", ["company_id", "professional_id"], name: "index_employments_on_company_id_and_professional_id", using: :btree

  create_table "professional_appointments", force: :cascade do |t|
    t.integer  "company_id",                limit: 4
    t.integer  "branch_id",                 limit: 4
    t.integer  "professional_id",           limit: 4
    t.integer  "client_id",                 limit: 4
    t.integer  "company_appointments_id",   limit: 4
    t.datetime "date_time",                                               null: false
    t.string   "status",                    limit: 255
    t.string   "photo",                     limit: 255
    t.string   "task_type",                 limit: 50
    t.text     "task_note",                 limit: 65535
    t.float    "total_project_price",       limit: 24
    t.float    "task_payment",              limit: 24
    t.float    "professional_fee",          limit: 24
    t.float    "remaining_project_payment", limit: 24
    t.boolean  "needs_folloup",                           default: false
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
  end

  add_index "professional_appointments", ["branch_id"], name: "index_professional_appointments_on_branch_id", using: :btree
  add_index "professional_appointments", ["client_id"], name: "index_professional_appointments_on_client_id", using: :btree
  add_index "professional_appointments", ["company_appointments_id"], name: "index_professional_appointments_on_company_appointments_id", using: :btree
  add_index "professional_appointments", ["company_id"], name: "index_professional_appointments_on_company_id", using: :btree
  add_index "professional_appointments", ["date_time"], name: "index_professional_appointments_on_date_time", using: :btree
  add_index "professional_appointments", ["professional_id"], name: "index_professional_appointments_on_professional_id", using: :btree

  create_table "professionals", force: :cascade do |t|
    t.string   "id_code",         limit: 25
    t.string   "first_name",      limit: 50,                  null: false
    t.string   "last_name",       limit: 50,                  null: false
    t.date     "dob",                                         null: false
    t.string   "email",           limit: 255, default: "@",   null: false
    t.string   "specialty",       limit: 25
    t.boolean  "pass_active",                 default: false
    t.boolean  "acc_active",                  default: false
    t.string   "password_digest", limit: 255
    t.datetime "last_in"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "professionals", ["dob"], name: "index_professionals_on_dob", using: :btree
  add_index "professionals", ["email"], name: "index_professionals_on_email", using: :btree
  add_index "professionals", ["id_code"], name: "index_professionals_on_id_code", using: :btree
  add_index "professionals", ["last_name"], name: "index_professionals_on_last_name", using: :btree
  add_index "professionals", ["specialty"], name: "index_professionals_on_specialty", using: :btree

  create_table "update_deletes", force: :cascade do |t|
    t.integer  "company_id",                   limit: 4
    t.integer  "branch_id",                    limit: 4
    t.integer  "professional_id",              limit: 4
    t.integer  "client_id",                    limit: 4
    t.integer  "contact_details_id",           limit: 4
    t.integer  "employment_id",                limit: 4
    t.integer  "appointments_id",              limit: 4
    t.integer  "professional_appointments_id", limit: 4
    t.integer  "update_deletes_id",            limit: 4
    t.string   "first_name",                   limit: 255
    t.string   "last_name",                    limit: 255
    t.string   "table_name",                   limit: 255
    t.string   "column_name",                  limit: 255
    t.string   "element",                      limit: 255
    t.string   "Action_taken",                 limit: 255
    t.text     "reason",                       limit: 65535
    t.string   "new_element",                  limit: 255
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "update_deletes", ["appointments_id"], name: "index_update_deletes_on_appointments_id", using: :btree
  add_index "update_deletes", ["branch_id"], name: "index_update_deletes_on_branch_id", using: :btree
  add_index "update_deletes", ["client_id"], name: "index_update_deletes_on_client_id", using: :btree
  add_index "update_deletes", ["company_id"], name: "index_update_deletes_on_company_id", using: :btree
  add_index "update_deletes", ["contact_details_id"], name: "index_update_deletes_on_contact_details_id", using: :btree
  add_index "update_deletes", ["employment_id"], name: "index_update_deletes_on_employment_id", using: :btree
  add_index "update_deletes", ["professional_id"], name: "index_update_deletes_on_professional_id", using: :btree
  add_index "update_deletes", ["update_deletes_id"], name: "index_update_deletes_on_update_deletes_id", using: :btree

end
