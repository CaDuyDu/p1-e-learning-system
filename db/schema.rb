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

ActiveRecord::Schema.define(version: 2019_03_27_100733) do

  create_table "ckeditor_assets", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.string "data_fingerprint"
    t.string "type", limit: 30
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type"
  end

  create_table "comment_lessons", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id"
    t.bigint "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id", "created_at"], name: "index_comment_lessons_on_lesson_id_and_created_at"
    t.index ["lesson_id"], name: "index_comment_lessons_on_lesson_id"
    t.index ["user_id", "created_at"], name: "index_comment_lessons_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_comment_lessons_on_user_id"
  end

  create_table "course_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.boolean "status"
    t.decimal "debit", precision: 10
    t.bigint "user_id"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id", "created_at"], name: "index_course_users_on_course_id_and_created_at"
    t.index ["course_id"], name: "index_course_users_on_course_id"
    t.index ["user_id", "created_at"], name: "index_course_users_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_course_users_on_user_id"
  end

  create_table "courses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "subject_id"
    t.bigint "user_id"
    t.string "course_name"
    t.integer "quantity_registered"
    t.date "start_time"
    t.string "description"
    t.decimal "price", precision: 20, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id", "created_at"], name: "index_courses_on_subject_id_and_created_at"
    t.index ["subject_id"], name: "index_courses_on_subject_id"
    t.index ["user_id", "created_at"], name: "index_courses_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_courses_on_user_id"
  end

  create_table "exercises", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "question"
    t.text "detailed_answer"
    t.integer "lesson_number"
    t.bigint "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id", "created_at"], name: "index_exercises_on_subject_id_and_created_at"
    t.index ["subject_id"], name: "index_exercises_on_subject_id"
  end

  create_table "exercises_answers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "content"
    t.boolean "is_current"
    t.bigint "exercise_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercise_id", "created_at"], name: "index_exercises_answers_on_exercise_id_and_created_at"
    t.index ["exercise_id"], name: "index_exercises_answers_on_exercise_id"
  end

  create_table "homework_results", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.decimal "total_score", precision: 10
    t.decimal "reward_points", precision: 10
    t.text "comment"
    t.bigint "user_id"
    t.bigint "homework_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["homework_id", "created_at"], name: "index_homework_results_on_homework_id_and_created_at"
    t.index ["homework_id"], name: "index_homework_results_on_homework_id"
    t.index ["user_id", "created_at"], name: "index_homework_results_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_homework_results_on_user_id"
  end

  create_table "homeworks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name_homework"
    t.integer "lesson_number"
    t.string "total_exercise"
    t.bigint "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id", "created_at"], name: "index_homeworks_on_lesson_id_and_created_at"
    t.index ["lesson_id"], name: "index_homeworks_on_lesson_id"
  end

  create_table "homeworks_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "homework_id"
    t.bigint "exercise_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercise_id", "created_at"], name: "index_homeworks_details_on_exercise_id_and_created_at"
    t.index ["exercise_id"], name: "index_homeworks_details_on_exercise_id"
    t.index ["homework_id", "created_at"], name: "index_homeworks_details_on_homework_id_and_created_at"
    t.index ["homework_id"], name: "index_homeworks_details_on_homework_id"
  end

  create_table "lesson_videos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "lesson_id"
    t.bigint "video_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id", "created_at"], name: "index_lesson_videos_on_lesson_id_and_created_at"
    t.index ["lesson_id"], name: "index_lesson_videos_on_lesson_id"
    t.index ["video_id", "created_at"], name: "index_lesson_videos_on_video_id_and_created_at"
    t.index ["video_id"], name: "index_lesson_videos_on_video_id"
  end

  create_table "lessons", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.bigint "user_id"
    t.bigint "course_id"
    t.bigint "video_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id", "created_at"], name: "index_lessons_on_course_id_and_created_at"
    t.index ["course_id"], name: "index_lessons_on_course_id"
    t.index ["user_id", "created_at"], name: "index_lessons_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_lessons_on_user_id"
    t.index ["video_id", "created_at"], name: "index_lessons_on_video_id_and_created_at"
    t.index ["video_id"], name: "index_lessons_on_video_id"
  end

  create_table "permissions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name_permission"
    t.string "path"
    t.integer "role_id"
    t.string "icon"
  end

  create_table "subjects", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name_subject"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "fullname"
    t.date "birth"
    t.integer "gender"
    t.string "address"
    t.string "numberphone"
    t.integer "role", default: 0, null: false
    t.string "avt"
    t.boolean "active"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_salt"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  create_table "videos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name_video"
    t.string "link"
    t.integer "lesson_number"
    t.string "description"
    t.bigint "subject_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id", "created_at"], name: "index_videos_on_subject_id_and_created_at"
    t.index ["subject_id"], name: "index_videos_on_subject_id"
    t.index ["user_id", "created_at"], name: "index_videos_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_videos_on_user_id"
  end

  add_foreign_key "comment_lessons", "lessons"
  add_foreign_key "comment_lessons", "users"
  add_foreign_key "course_users", "courses"
  add_foreign_key "course_users", "users"
  add_foreign_key "courses", "subjects"
  add_foreign_key "courses", "users"
  add_foreign_key "exercises", "subjects"
  add_foreign_key "exercises_answers", "exercises"
  add_foreign_key "homework_results", "homeworks"
  add_foreign_key "homework_results", "users"
  add_foreign_key "homeworks", "lessons"
  add_foreign_key "homeworks_details", "exercises"
  add_foreign_key "homeworks_details", "homeworks"
  add_foreign_key "lesson_videos", "lessons"
  add_foreign_key "lesson_videos", "videos"
  add_foreign_key "lessons", "courses"
  add_foreign_key "lessons", "users"
  add_foreign_key "lessons", "videos"
  add_foreign_key "videos", "subjects"
  add_foreign_key "videos", "users"
end
