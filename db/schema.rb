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

ActiveRecord::Schema.define(version: 20180312032315) do

  create_table "accounts_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_accounts_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_accounts_users_on_reset_password_token", unique: true
  end

  create_table "group_members", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "organization_member_id"
    t.bigint "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_group_members_on_group_id"
    t.index ["organization_member_id"], name: "index_group_members_on_organization_member_id"
  end

  create_table "groups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "organization_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_groups_on_organization_id"
  end

  create_table "message_meta", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "messageable_type"
    t.bigint "messageable_id"
    t.bigint "notifications_message_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["messageable_type", "messageable_id"], name: "index_message_meta_on_messageable_type_and_messageable_id"
    t.index ["notifications_message_id"], name: "index_message_meta_on_notifications_message_id"
  end

  create_table "message_users", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "accounts_user_id"
    t.bigint "notifications_message_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accounts_user_id"], name: "index_message_users_on_accounts_user_id"
    t.index ["notifications_message_id"], name: "index_message_users_on_notifications_message_id"
  end

  create_table "notifications_messages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organization_members", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "accounts_user_id"
    t.bigint "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accounts_user_id"], name: "index_organization_members_on_accounts_user_id"
    t.index ["organization_id"], name: "index_organization_members_on_organization_id"
  end

  create_table "organizations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.string "description_md"
    t.bigint "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_projects_on_group_id"
  end

  add_foreign_key "group_members", "groups"
  add_foreign_key "group_members", "organization_members"
  add_foreign_key "groups", "organizations"
  add_foreign_key "message_users", "accounts_users"
  add_foreign_key "message_users", "notifications_messages"
  add_foreign_key "organization_members", "accounts_users"
  add_foreign_key "organization_members", "organizations"
  add_foreign_key "projects", "groups"
end
