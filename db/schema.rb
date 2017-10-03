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

ActiveRecord::Schema.define(version: 20170630080346) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actors", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "actors_tv_shows", id: false, force: :cascade do |t|
    t.integer "actor_id"
    t.integer "tv_shows_id"
    t.index ["actor_id", "tv_shows_id"], name: "index_actors_tv_shows_on_actor_id_and_tv_shows_id", using: :btree
  end

  create_table "directors", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "episode_comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "episode_id"
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["episode_id"], name: "index_episode_comments_on_episode_id", using: :btree
    t.index ["user_id"], name: "index_episode_comments_on_user_id", using: :btree
  end

  create_table "episode_ratins", force: :cascade do |t|
    t.integer  "rating"
    t.boolean  "favorite",   default: false
    t.boolean  "seen",       default: false
    t.integer  "user_id"
    t.integer  "episode_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["episode_id"], name: "index_episode_ratins_on_episode_id", using: :btree
    t.index ["user_id"], name: "index_episode_ratins_on_user_id", using: :btree
  end

  create_table "episodes", force: :cascade do |t|
    t.string   "name"
    t.integer  "season"
    t.string   "description"
    t.integer  "duration"
    t.integer  "release_year"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "tv_show_id"
    t.boolean  "favorite",     default: false
    t.boolean  "seen",         default: false
    t.integer  "rating"
    t.index ["tv_show_id"], name: "index_episodes_on_tv_show_id", using: :btree
  end

  create_table "fav_episodes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "episode_id"
    t.boolean  "favorite"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["episode_id"], name: "index_fav_episodes_on_episode_id", using: :btree
    t.index ["user_id"], name: "index_fav_episodes_on_user_id", using: :btree
  end

  create_table "fav_shows", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "tv_show_id"
    t.boolean  "favorite"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tv_show_id"], name: "index_fav_shows_on_tv_show_id", using: :btree
    t.index ["user_id"], name: "index_fav_shows_on_user_id", using: :btree
  end

  create_table "fav_tvshows", force: :cascade do |t|
    t.integer "tv_show_id"
    t.integer "user_id"
    t.boolean "favorite"
    t.index ["tv_show_id"], name: "index_fav_tvshows_on_tv_show_id", using: :btree
    t.index ["user_id"], name: "index_fav_tvshows_on_user_id", using: :btree
  end

  create_table "genders", force: :cascade do |t|
    t.string   "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres_tv_shows", id: false, force: :cascade do |t|
    t.integer "genre_id"
    t.integer "tv_shows_id"
    t.index ["genre_id", "tv_shows_id"], name: "index_genres_tv_shows_on_genre_id_and_tv_shows_id", using: :btree
  end

  create_table "identities", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_identities_on_user_id", using: :btree
  end

  create_table "mailingl_forms", force: :cascade do |t|
    t.string   "subject"
    t.string   "body"
    t.string   "to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "news", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "tv_show_id"
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tv_show_id"], name: "index_news_on_tv_show_id", using: :btree
    t.index ["user_id"], name: "index_news_on_user_id", using: :btree
  end

  create_table "notices", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "tv_show_id"
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tv_show_id"], name: "index_notices_on_tv_show_id", using: :btree
    t.index ["user_id"], name: "index_notices_on_user_id", using: :btree
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "father_id"
    t.integer  "child_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["child_id"], name: "index_relationships_on_child_id", using: :btree
    t.index ["father_id", "child_id"], name: "index_relationships_on_father_id_and_child_id", unique: true, using: :btree
    t.index ["father_id"], name: "index_relationships_on_father_id", using: :btree
  end

  create_table "subtitles", force: :cascade do |t|
    t.string   "language"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tv_show_comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "tv_show_id"
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tv_show_id"], name: "index_tv_show_comments_on_tv_show_id", using: :btree
    t.index ["user_id"], name: "index_tv_show_comments_on_user_id", using: :btree
  end

  create_table "tv_show_ratings", force: :cascade do |t|
    t.integer  "ranting"
    t.boolean  "favorite"
    t.integer  "user_id"
    t.integer  "tv_show_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tv_show_id"], name: "index_tv_show_ratings_on_tv_show_id", using: :btree
    t.index ["user_id"], name: "index_tv_show_ratings_on_user_id", using: :btree
  end

  create_table "tv_shows", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "country"
    t.string   "language"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
    t.integer  "user_id"
    t.integer  "gender_id"
    t.integer  "director_id"
    t.string   "url"
    t.string   "final_url"
    t.index ["director_id"], name: "index_tv_shows_on_director_id", using: :btree
    t.index ["gender_id"], name: "index_tv_shows_on_gender_id", using: :btree
    t.index ["user_id"], name: "index_tv_shows_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "role"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "episode_comments", "episodes"
  add_foreign_key "episode_comments", "users"
  add_foreign_key "episode_ratins", "episodes"
  add_foreign_key "episode_ratins", "users"
  add_foreign_key "episodes", "tv_shows"
  add_foreign_key "fav_episodes", "episodes"
  add_foreign_key "fav_episodes", "users"
  add_foreign_key "fav_shows", "tv_shows", on_delete: :cascade
  add_foreign_key "fav_shows", "users", on_delete: :cascade
  add_foreign_key "fav_tvshows", "tv_shows"
  add_foreign_key "fav_tvshows", "users"
  add_foreign_key "identities", "users", on_delete: :cascade
  add_foreign_key "news", "tv_shows"
  add_foreign_key "news", "users"
  add_foreign_key "notices", "tv_shows"
  add_foreign_key "notices", "users"
  add_foreign_key "tv_show_comments", "tv_shows"
  add_foreign_key "tv_show_comments", "users"
  add_foreign_key "tv_show_ratings", "tv_shows"
  add_foreign_key "tv_show_ratings", "users"
  add_foreign_key "tv_shows", "directors"
  add_foreign_key "tv_shows", "genders"
  add_foreign_key "tv_shows", "users"
end
