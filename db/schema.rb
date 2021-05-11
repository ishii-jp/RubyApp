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

ActiveRecord::Schema.define(version: 2021_05_11_012322) do

  create_table "request_approve_histories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "request_id", null: false, comment: "申請ID"
    t.integer "approver_id", null: false, comment: "承認者ID"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["request_id", "approver_id"], name: "index_request_approve_histories_on_request_id_and_approver_id", unique: true
  end

  create_table "request_approvers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "request_id", null: false, comment: "申請ID"
    t.integer "approver_id", null: false, comment: "承認者ID"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "request_categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false, comment: "カテゴリー名"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "requests", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id", null: false, comment: "ユーザーID"
    t.integer "category_id", null: false, comment: "カテゴリーID"
    t.integer "approver_id", null: false, comment: "承認者ID"
    t.string "title", comment: "件名"
    t.integer "price", null: false, comment: "値段"
    t.string "body", null: false, comment: "申請理由"
    t.integer "approval_flg", default: 0, null: false, comment: "承認フラグ 0:未承認 1:承認"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false, comment: "名前"
    t.string "email", null: false, comment: "メールアドレス"
    t.string "password_digest", null: false, comment: "パスワード"
    t.boolean "admin", default: false, null: false
    t.boolean "status_flg", default: false, null: false, comment: "有効フラグ 0:有効 1:無効"
    t.timestamp "last_login_timestamp", comment: "最後にログインを行った日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
