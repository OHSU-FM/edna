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

ActiveRecord::Schema.define(version: 20141024153916) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chart_series", force: true do |t|
    t.integer  "chart_id"
    t.text     "group_filter"
    t.text     "entity_filter"
    t.text     "category_filter"
    t.text     "question_filter"
    t.text     "question_options_filter"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "chart_series", ["chart_id"], name: "index_chart_series_on_chart_id", using: :btree

  create_table "charts", force: true do |t|
    t.integer  "user_id"
    t.text     "title"
    t.text     "output"
    t.text     "chart_type"
    t.text     "aggregator_type"
    t.text     "cols"
    t.text     "rows"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "charts", ["user_id"], name: "index_charts_on_user_id", using: :btree

  create_table "content_slugs", force: true do |t|
    t.integer "user_id"
    t.text    "content"
    t.boolean "public"
    t.integer "sizex"
    t.integer "sizey"
    t.boolean "resizeable", default: true
  end

  create_table "critical_values", id: false, force: true do |t|
    t.integer "df",                   null: false
    t.decimal "t",                    null: false
    t.decimal "alpha", default: 0.05, null: false
  end

  create_table "dashboard_widgets", force: true do |t|
    t.integer "dashboard_id"
    t.integer "position"
    t.integer "sizex"
    t.integer "sizey"
    t.boolean "resizeable",   default: true
    t.text    "widget_type"
    t.integer "widget_id"
  end

  create_table "dashboards", force: true do |t|
    t.integer "user_id"
    t.text    "theme"
  end

  create_table "data_migrations", force: true do |t|
    t.text "version", null: false
  end

  create_table "lime_answers", id: false, force: true do |t|
    t.integer "qid",                         default: 0,    null: false
    t.string  "code",             limit: 5,  default: "",   null: false
    t.text    "answer",                                     null: false
    t.integer "sortorder",                                  null: false
    t.string  "language",         limit: 20, default: "en", null: false
    t.integer "assessment_value",            default: 0,    null: false
    t.integer "scale_id",                    default: 0,    null: false
  end

  add_index "lime_answers", ["sortorder"], name: "answers_idx2", using: :btree

  create_table "lime_assessments", force: true do |t|
    t.integer "sid",                 default: 0,    null: false
    t.string  "scope",    limit: 5,  default: "",   null: false
    t.integer "gid",                 default: 0,    null: false
    t.text    "name",                               null: false
    t.string  "minimum",  limit: 50, default: "",   null: false
    t.string  "maximum",  limit: 50, default: "",   null: false
    t.text    "message",                            null: false
    t.string  "language", limit: 20, default: "en", null: false
  end

  add_index "lime_assessments", ["gid"], name: "assessments_idx3", using: :btree
  add_index "lime_assessments", ["sid"], name: "assessments_idx2", using: :btree

  create_table "lime_conditions", primary_key: "cid", force: true do |t|
    t.integer "qid",                   default: 0,  null: false
    t.integer "cqid",                  default: 0,  null: false
    t.string  "cfieldname", limit: 50, default: "", null: false
    t.string  "method",     limit: 5,  default: "", null: false
    t.string  "value",                 default: "", null: false
    t.integer "scenario",              default: 1,  null: false
  end

  add_index "lime_conditions", ["cqid"], name: "conditions_idx3", using: :btree
  add_index "lime_conditions", ["qid"], name: "conditions_idx2", using: :btree

  create_table "lime_defaultvalues", id: false, force: true do |t|
    t.integer "qid",                     default: 0,  null: false
    t.integer "scale_id",                default: 0,  null: false
    t.integer "sqid",                    default: 0,  null: false
    t.string  "language",     limit: 20,              null: false
    t.string  "specialtype",  limit: 20, default: "", null: false
    t.text    "defaultvalue"
  end

  create_table "lime_expression_errors", force: true do |t|
    t.string  "errortime",   limit: 50
    t.integer "sid"
    t.integer "gid"
    t.integer "qid"
    t.integer "gseq"
    t.integer "qseq"
    t.string  "type",        limit: 50
    t.text    "eqn"
    t.text    "prettyprint"
  end

  create_table "lime_failed_login_attempts", force: true do |t|
    t.string  "ip",              limit: 40, null: false
    t.string  "last_attempt",    limit: 20, null: false
    t.integer "number_attempts",            null: false
  end

  create_table "lime_groups", primary_key: "gid", force: true do |t|
    t.integer "sid",                             default: 0,    null: false
    t.string  "group_name",          limit: 100, default: "",   null: false
    t.integer "group_order",                     default: 0,    null: false
    t.text    "description"
    t.string  "language",            limit: 20,  default: "en", null: false
    t.string  "randomization_group", limit: 20,  default: "",   null: false
    t.text    "grelevance"
  end

  add_index "lime_groups", ["sid"], name: "groups_idx2", using: :btree

  create_table "lime_labels", id: false, force: true do |t|
    t.integer "lid",                         default: 0,    null: false
    t.string  "code",             limit: 5,  default: "",   null: false
    t.text    "title"
    t.integer "sortorder",                                  null: false
    t.integer "assessment_value",            default: 0,    null: false
    t.string  "language",         limit: 20, default: "en", null: false
  end

  add_index "lime_labels", ["code"], name: "labels_code_idx", using: :btree

  create_table "lime_labelsets", primary_key: "lid", force: true do |t|
    t.string "label_name", limit: 100, default: "",   null: false
    t.string "languages",  limit: 200, default: "en"
  end

  create_table "lime_old_survey_619823_20141008103010", force: true do |t|
    t.string   "token",            limit: 36
    t.datetime "submitdate"
    t.integer  "lastpage"
    t.string   "startlanguage",    limit: 20, null: false
    t.string   "619823X3X67SQ001", limit: 5
    t.string   "619823X3X69SQ001", limit: 5
    t.string   "619823X3X71SQ001", limit: 5
    t.text     "619823X3X73"
    t.text     "619823X3X74"
    t.string   "619823X3X75"
    t.string   "619823X3X76"
    t.string   "619823X3X102"
  end

  add_index "lime_old_survey_619823_20141008103010", ["token"], name: "idx_survey_token_619823_27268", using: :btree

  create_table "lime_participant_attribute", id: false, force: true do |t|
    t.string  "participant_id", limit: 50, null: false
    t.integer "attribute_id",              null: false
    t.text    "value",                     null: false
  end

  create_table "lime_participant_attribute_names", primary_key: "attribute_id", force: true do |t|
    t.string "attribute_type", limit: 4,  null: false
    t.string "defaultname",    limit: 50, null: false
    t.string "visible",        limit: 5,  null: false
  end

  create_table "lime_participant_attribute_names_lang", id: false, force: true do |t|
    t.integer "attribute_id",              null: false
    t.string  "attribute_name", limit: 30, null: false
    t.string  "lang",                      null: false
  end

  create_table "lime_participant_attribute_values", primary_key: "value_id", force: true do |t|
    t.integer "attribute_id", null: false
    t.text    "value",        null: false
  end

  create_table "lime_participant_shares", id: false, force: true do |t|
    t.string   "participant_id", limit: 50, null: false
    t.integer  "share_uid",                 null: false
    t.datetime "date_added",                null: false
    t.string   "can_edit",       limit: 5,  null: false
  end

  create_table "lime_participants", id: false, force: true do |t|
    t.string   "participant_id", limit: 50,  null: false
    t.string   "firstname",      limit: 40
    t.string   "lastname",       limit: 40
    t.string   "email",          limit: 254
    t.string   "language",       limit: 40
    t.string   "blacklisted",    limit: 1,   null: false
    t.integer  "owner_uid",                  null: false
    t.integer  "created_by",                 null: false
    t.datetime "created"
    t.datetime "modified"
  end

  create_table "lime_permissions", force: true do |t|
    t.string  "entity",     limit: 50,              null: false
    t.integer "entity_id",                          null: false
    t.integer "uid",                                null: false
    t.string  "permission", limit: 100,             null: false
    t.integer "create_p",               default: 0, null: false
    t.integer "read_p",                 default: 0, null: false
    t.integer "update_p",               default: 0, null: false
    t.integer "delete_p",               default: 0, null: false
    t.integer "import_p",               default: 0, null: false
    t.integer "export_p",               default: 0, null: false
  end

  add_index "lime_permissions", ["entity_id", "entity", "uid", "permission"], name: "permissions_idx2", unique: true, using: :btree

  create_table "lime_plugin_settings", force: true do |t|
    t.integer "plugin_id",            null: false
    t.string  "model",     limit: 50
    t.integer "model_id"
    t.string  "key",       limit: 50, null: false
    t.text    "value"
  end

  create_table "lime_plugins", force: true do |t|
    t.string  "name",   limit: 50,             null: false
    t.integer "active",            default: 0, null: false
  end

  create_table "lime_question_attributes", primary_key: "qaid", force: true do |t|
    t.integer "qid",                  default: 0, null: false
    t.string  "attribute", limit: 50
    t.text    "value"
    t.string  "language",  limit: 20
  end

  add_index "lime_question_attributes", ["attribute"], name: "question_attributes_idx3", using: :btree
  add_index "lime_question_attributes", ["qid"], name: "question_attributes_idx2", using: :btree

  create_table "lime_questions", primary_key: "qid", force: true do |t|
    t.integer "parent_qid",                default: 0,    null: false
    t.integer "sid",                       default: 0,    null: false
    t.integer "gid",                       default: 0,    null: false
    t.string  "type",           limit: 1,  default: "T",  null: false
    t.string  "title",          limit: 20, default: "",   null: false
    t.text    "question",                                 null: false
    t.text    "preg"
    t.text    "help"
    t.string  "other",          limit: 1,  default: "N",  null: false
    t.string  "mandatory",      limit: 1
    t.integer "question_order",                           null: false
    t.string  "language",       limit: 20, default: "en", null: false
    t.integer "scale_id",                  default: 0,    null: false
    t.integer "same_default",              default: 0,    null: false
    t.text    "relevance"
  end

  add_index "lime_questions", ["gid"], name: "questions_idx3", using: :btree
  add_index "lime_questions", ["parent_qid"], name: "parent_qid_idx", using: :btree
  add_index "lime_questions", ["sid"], name: "questions_idx2", using: :btree
  add_index "lime_questions", ["type"], name: "questions_idx4", using: :btree

  create_table "lime_quota", force: true do |t|
    t.integer "sid"
    t.string  "name"
    t.integer "qlimit"
    t.integer "action"
    t.integer "active",       default: 1, null: false
    t.integer "autoload_url", default: 0, null: false
  end

  add_index "lime_quota", ["sid"], name: "quota_idx2", using: :btree

  create_table "lime_quota_languagesettings", primary_key: "quotals_id", force: true do |t|
    t.integer "quotals_quota_id",              default: 0,    null: false
    t.string  "quotals_language",   limit: 45, default: "en", null: false
    t.string  "quotals_name"
    t.text    "quotals_message",                              null: false
    t.string  "quotals_url"
    t.string  "quotals_urldescrip"
  end

  create_table "lime_quota_members", force: true do |t|
    t.integer "sid"
    t.integer "qid"
    t.integer "quota_id"
    t.string  "code",     limit: 11
  end

  add_index "lime_quota_members", ["sid", "qid", "quota_id", "code"], name: "lime_quota_members_ixcode_idx", using: :btree

  create_table "lime_saved_control", primary_key: "scid", force: true do |t|
    t.integer  "sid",                        default: 0,  null: false
    t.integer  "srid",                       default: 0,  null: false
    t.text     "identifier",                              null: false
    t.text     "access_code",                             null: false
    t.string   "email",          limit: 254
    t.text     "ip",                                      null: false
    t.text     "saved_thisstep",                          null: false
    t.string   "status",         limit: 1,   default: "", null: false
    t.datetime "saved_date",                              null: false
    t.text     "refurl"
  end

  add_index "lime_saved_control", ["sid"], name: "saved_control_idx2", using: :btree

  create_table "lime_sessions", id: false, force: true do |t|
    t.string  "id",     limit: 32, null: false
    t.integer "expire"
    t.binary  "data"
  end

  create_table "lime_settings_global", id: false, force: true do |t|
    t.string "stg_name",  limit: 50, default: "", null: false
    t.string "stg_value",            default: "", null: false
  end

  create_table "lime_survey_286313", force: true do |t|
    t.datetime "submitdate"
    t.integer  "lastpage"
    t.string   "startlanguage",     limit: 20, null: false
    t.string   "286313X5X104"
    t.string   "286313X5X103SQ001", limit: 5
    t.string   "286313X5X103SQ002", limit: 5
    t.string   "286313X5X103SQ003", limit: 5
    t.string   "286313X5X103SQ004", limit: 5
    t.string   "286313X5X103SQ005", limit: 5
    t.string   "286313X5X103SQ006", limit: 5
    t.string   "286313X5X103SQ007", limit: 5
    t.string   "286313X5X103SQ008", limit: 5
    t.string   "286313X5X103SQ009", limit: 5
    t.string   "286313X5X103SQ010", limit: 5
    t.string   "286313X5X103SQ011", limit: 5
    t.string   "286313X5X103SQ012", limit: 5
  end

  create_table "lime_survey_515866", force: true do |t|
    t.string   "token",            limit: 36
    t.datetime "submitdate"
    t.integer  "lastpage"
    t.string   "startlanguage",    limit: 20, null: false
    t.datetime "startdate",                   null: false
    t.datetime "datestamp",                   null: false
    t.string   "515866X1X1SQ001",  limit: 5
    t.string   "515866X1X2SQ001",  limit: 5
    t.string   "515866X1X3",       limit: 5
    t.text     "515866X1X3other"
    t.string   "515866X1X4",       limit: 1
    t.string   "515866X1X5",       limit: 5
    t.text     "515866X1X5other"
    t.string   "515866X1X6SQ001",  limit: 5
    t.string   "515866X1X6SQ002",  limit: 5
    t.string   "515866X1X6SQ003",  limit: 5
    t.string   "515866X1X6SQ004",  limit: 5
    t.string   "515866X1X6SQ005",  limit: 5
    t.string   "515866X1X6SQ006",  limit: 5
    t.string   "515866X1X6SQ007",  limit: 5
    t.string   "515866X1X6SQ008",  limit: 5
    t.string   "515866X1X6SQ009",  limit: 5
    t.string   "515866X1X7SQ001",  limit: 5
    t.string   "515866X1X8SQ001",  limit: 5
    t.string   "515866X1X8SQ002",  limit: 5
    t.string   "515866X1X8SQ003",  limit: 5
    t.string   "515866X1X8SQ004",  limit: 5
    t.string   "515866X1X8SQ005",  limit: 5
    t.string   "515866X1X8SQ006",  limit: 5
    t.string   "515866X1X9",       limit: 5
    t.string   "515866X1X10",      limit: 5
    t.text     "515866X1X10other"
    t.text     "515866X1X11"
  end

  add_index "lime_survey_515866", ["token"], name: "idx_survey_token_515866_44125", using: :btree

  create_table "lime_survey_515866_timings", force: true do |t|
    t.float "interviewtime"
    t.float "515866X1time"
    t.float "515866X1X1time"
    t.float "515866X1X2time"
    t.float "515866X1X3time"
    t.float "515866X1X4time"
    t.float "515866X1X5time"
    t.float "515866X1X6time"
    t.float "515866X1X7time"
    t.float "515866X1X8time"
    t.float "515866X1X9time"
    t.float "515866X1X10time"
    t.float "515866X1X11time"
  end

  create_table "lime_survey_619823", force: true do |t|
    t.string   "token",            limit: 36
    t.datetime "submitdate"
    t.integer  "lastpage"
    t.string   "startlanguage",    limit: 20, null: false
    t.string   "619823X3X67SQ001", limit: 5
    t.string   "619823X3X69SQ001", limit: 5
    t.string   "619823X3X71SQ001", limit: 5
    t.text     "619823X3X73"
    t.text     "619823X3X74"
    t.string   "619823X3X75"
    t.string   "619823X3X76"
    t.string   "619823X3X102"
  end

  add_index "lime_survey_619823", ["token"], name: "idx_survey_token_619823_15453", using: :btree

  create_table "lime_survey_763739", force: true do |t|
    t.string   "token",                           limit: 36
    t.datetime "submitdate"
    t.integer  "lastpage"
    t.string   "startlanguage",                   limit: 20, null: false
    t.string   "763739X4X101"
    t.string   "763739X4X77RateYourHealth4Weeks", limit: 5
    t.string   "763739X4X78ProblemsWalking",      limit: 5
    t.string   "763739X4X78DifficultDailyWork",   limit: 5
    t.string   "763739X4X78EmotionsProb",         limit: 5
    t.string   "763739X4X78PersonalProbUsualWor", limit: 5
    t.string   "763739X4X79BodilyPain",           limit: 5
    t.string   "763739X4X80Past4WeekEnergyLevel", limit: 5
    t.string   "763739X4X81BotheredEmotionalPro", limit: 5
    t.string   "763739X4X82BennUpset",            limit: 5
    t.string   "763739X4X82UnableControl",        limit: 5
    t.string   "763739X4X82FeltNervous",          limit: 5
    t.string   "763739X4X82FeltConfident",        limit: 5
    t.string   "763739X4X82FeltGoingYourWay",     limit: 5
    t.string   "763739X4X82CouldNotCope",         limit: 5
    t.string   "763739X4X82AbleToControl",        limit: 5
    t.string   "763739X4X82OnTopOfThings",        limit: 5
    t.string   "763739X4X82BeenAngered",          limit: 5
    t.string   "763739X4X82PilingUpHigh",         limit: 5
  end

  add_index "lime_survey_763739", ["token"], name: "idx_survey_token_763739_5664", using: :btree

  create_table "lime_survey_916752", force: true do |t|
    t.string   "token",            limit: 36
    t.datetime "submitdate"
    t.integer  "lastpage"
    t.string   "startlanguage",    limit: 20, null: false
    t.datetime "startdate",                   null: false
    t.datetime "datestamp",                   null: false
    t.string   "916752X2X30SQ001", limit: 5
    t.string   "916752X2X31",      limit: 5
    t.string   "916752X2X32",      limit: 1
    t.string   "916752X2X33",      limit: 5
    t.text     "916752X2X33other"
    t.string   "916752X2X34",      limit: 1
    t.string   "916752X2X35",      limit: 5
    t.text     "916752X2X35other"
    t.string   "916752X2X36",      limit: 1
    t.string   "916752X2X37",      limit: 5
    t.text     "916752X2X37other"
    t.string   "916752X2X381",     limit: 5
    t.string   "916752X2X382",     limit: 5
    t.string   "916752X2X383",     limit: 5
    t.string   "916752X2X384",     limit: 5
    t.string   "916752X2X385",     limit: 5
    t.string   "916752X2X386",     limit: 5
    t.string   "916752X2X387",     limit: 5
    t.string   "916752X2X388",     limit: 5
    t.text     "916752X2X38other"
    t.string   "916752X2X39SQ001", limit: 5
    t.string   "916752X2X40SQ001", limit: 5
    t.string   "916752X2X40SQ002", limit: 5
    t.string   "916752X2X40SQ003", limit: 5
    t.string   "916752X2X40SQ004", limit: 5
    t.string   "916752X2X40SQ005", limit: 5
    t.string   "916752X2X40SQ006", limit: 5
    t.string   "916752X2X41SQ001", limit: 5
    t.string   "916752X2X41SQ002", limit: 5
    t.string   "916752X2X41SQ003", limit: 5
    t.string   "916752X2X41SQ004", limit: 5
    t.string   "916752X2X41SQ005", limit: 5
    t.string   "916752X2X41SQ006", limit: 5
    t.text     "916752X2X42"
  end

  add_index "lime_survey_916752", ["token"], name: "idx_survey_token_916752_28174", using: :btree

  create_table "lime_survey_916752_timings", force: true do |t|
    t.float "interviewtime"
    t.float "916752X2time"
    t.float "916752X2X30time"
    t.float "916752X2X31time"
    t.float "916752X2X32time"
    t.float "916752X2X33time"
    t.float "916752X2X34time"
    t.float "916752X2X35time"
    t.float "916752X2X36time"
    t.float "916752X2X37time"
    t.float "916752X2X38time"
    t.float "916752X2X39time"
    t.float "916752X2X40time"
    t.float "916752X2X41time"
    t.float "916752X2X42time"
  end

  create_table "lime_survey_links", id: false, force: true do |t|
    t.string   "participant_id", limit: 50, null: false
    t.integer  "token_id",                  null: false
    t.integer  "survey_id",                 null: false
    t.datetime "date_created"
    t.datetime "date_invited"
    t.datetime "date_completed"
  end

  create_table "lime_survey_url_parameters", force: true do |t|
    t.integer "sid",                   null: false
    t.string  "parameter",  limit: 50, null: false
    t.integer "targetqid"
    t.integer "targetsqid"
  end

  create_table "lime_surveys", id: false, force: true do |t|
    t.integer  "sid",                                                      null: false
    t.integer  "owner_id",                                                 null: false
    t.string   "admin",                    limit: 50
    t.string   "active",                   limit: 1,   default: "N",       null: false
    t.datetime "expires"
    t.datetime "startdate"
    t.string   "adminemail",               limit: 254
    t.string   "anonymized",               limit: 1,   default: "N",       null: false
    t.string   "faxto",                    limit: 20
    t.string   "format",                   limit: 1
    t.string   "savetimings",              limit: 1,   default: "N",       null: false
    t.string   "template",                 limit: 100, default: "default"
    t.string   "language",                 limit: 50
    t.string   "additional_languages"
    t.string   "datestamp",                limit: 1,   default: "N",       null: false
    t.string   "usecookie",                limit: 1,   default: "N",       null: false
    t.string   "allowregister",            limit: 1,   default: "N",       null: false
    t.string   "allowsave",                limit: 1,   default: "Y",       null: false
    t.integer  "autonumber_start",                     default: 0,         null: false
    t.string   "autoredirect",             limit: 1,   default: "N",       null: false
    t.string   "allowprev",                limit: 1,   default: "N",       null: false
    t.string   "printanswers",             limit: 1,   default: "N",       null: false
    t.string   "ipaddr",                   limit: 1,   default: "N",       null: false
    t.string   "refurl",                   limit: 1,   default: "N",       null: false
    t.date     "datecreated"
    t.string   "publicstatistics",         limit: 1,   default: "N",       null: false
    t.string   "publicgraphs",             limit: 1,   default: "N",       null: false
    t.string   "listpublic",               limit: 1,   default: "N",       null: false
    t.string   "htmlemail",                limit: 1,   default: "N",       null: false
    t.string   "sendconfirmation",         limit: 1,   default: "Y",       null: false
    t.string   "tokenanswerspersistence",  limit: 1,   default: "N",       null: false
    t.string   "assessments",              limit: 1,   default: "N",       null: false
    t.string   "usecaptcha",               limit: 1,   default: "N",       null: false
    t.string   "usetokens",                limit: 1,   default: "N",       null: false
    t.string   "bounce_email",             limit: 254
    t.text     "attributedescriptions"
    t.text     "emailresponseto"
    t.text     "emailnotificationto"
    t.integer  "tokenlength",                          default: 15,        null: false
    t.string   "showxquestions",           limit: 1,   default: "Y"
    t.string   "showgroupinfo",            limit: 1,   default: "B"
    t.string   "shownoanswer",             limit: 1,   default: "Y"
    t.string   "showqnumcode",             limit: 1,   default: "X"
    t.integer  "bouncetime"
    t.string   "bounceprocessing",         limit: 1,   default: "N"
    t.string   "bounceaccounttype",        limit: 4
    t.string   "bounceaccounthost",        limit: 200
    t.string   "bounceaccountpass",        limit: 100
    t.string   "bounceaccountencryption",  limit: 3
    t.string   "bounceaccountuser",        limit: 200
    t.string   "showwelcome",              limit: 1,   default: "Y"
    t.string   "showprogress",             limit: 1,   default: "Y"
    t.integer  "questionindex",                        default: 0,         null: false
    t.integer  "navigationdelay",                      default: 0,         null: false
    t.string   "nokeyboard",               limit: 1,   default: "N"
    t.string   "alloweditaftercompletion", limit: 1,   default: "N"
    t.string   "googleanalyticsstyle",     limit: 1
    t.string   "googleanalyticsapikey",    limit: 25
  end

  create_table "lime_surveys_languagesettings", id: false, force: true do |t|
    t.integer "surveyls_survey_id",                                       null: false
    t.string  "surveyls_language",             limit: 45,  default: "en", null: false
    t.string  "surveyls_title",                limit: 200,                null: false
    t.text    "surveyls_description"
    t.text    "surveyls_welcometext"
    t.text    "surveyls_endtext"
    t.text    "surveyls_url"
    t.string  "surveyls_urldescription"
    t.string  "surveyls_email_invite_subj"
    t.text    "surveyls_email_invite"
    t.string  "surveyls_email_remind_subj"
    t.text    "surveyls_email_remind"
    t.string  "surveyls_email_register_subj"
    t.text    "surveyls_email_register"
    t.string  "surveyls_email_confirm_subj"
    t.text    "surveyls_email_confirm"
    t.integer "surveyls_dateformat",                       default: 1,    null: false
    t.text    "surveyls_attributecaptions"
    t.string  "email_admin_notification_subj"
    t.text    "email_admin_notification"
    t.string  "email_admin_responses_subj"
    t.text    "email_admin_responses"
    t.integer "surveyls_numberformat",                     default: 0,    null: false
    t.text    "attachments"
  end

  create_table "lime_templates", id: false, force: true do |t|
    t.string  "folder",  null: false
    t.integer "creator", null: false
  end

  create_table "lime_tokens_286313", primary_key: "tid", force: true do |t|
    t.string   "participant_id", limit: 50
    t.string   "firstname",      limit: 40
    t.string   "lastname",       limit: 40
    t.text     "email"
    t.text     "emailstatus"
    t.string   "token",          limit: 35
    t.string   "language",       limit: 25
    t.string   "blacklisted",    limit: 17
    t.string   "sent",           limit: 17, default: "N"
    t.string   "remindersent",   limit: 17, default: "N"
    t.integer  "remindercount",             default: 0
    t.string   "completed",      limit: 17, default: "N"
    t.integer  "usesleft",                  default: 1
    t.datetime "validfrom"
    t.datetime "validuntil"
    t.integer  "mpid"
    t.string   "attribute_1"
  end

  add_index "lime_tokens_286313", ["token"], name: "idx_token_token_286313_34289", using: :btree

  create_table "lime_tokens_515866", primary_key: "tid", force: true do |t|
    t.string   "participant_id", limit: 50
    t.string   "firstname",      limit: 40
    t.string   "lastname",       limit: 40
    t.text     "email"
    t.text     "emailstatus"
    t.string   "token",          limit: 35
    t.string   "language",       limit: 25
    t.string   "blacklisted",    limit: 17
    t.string   "sent",           limit: 17, default: "N"
    t.string   "remindersent",   limit: 17, default: "N"
    t.integer  "remindercount",             default: 0
    t.string   "completed",      limit: 17, default: "N"
    t.integer  "usesleft",                  default: 1
    t.datetime "validfrom"
    t.datetime "validuntil"
    t.integer  "mpid"
    t.string   "attribute_1"
  end

  add_index "lime_tokens_515866", ["token"], name: "idx_token_token_515866_30762", using: :btree

  create_table "lime_tokens_916752", primary_key: "tid", force: true do |t|
    t.string   "participant_id", limit: 50
    t.string   "firstname",      limit: 40
    t.string   "lastname",       limit: 40
    t.text     "email"
    t.text     "emailstatus"
    t.string   "token",          limit: 35
    t.string   "language",       limit: 25
    t.string   "blacklisted",    limit: 17
    t.string   "sent",           limit: 17, default: "N"
    t.string   "remindersent",   limit: 17, default: "N"
    t.integer  "remindercount",             default: 0
    t.string   "completed",      limit: 17, default: "N"
    t.integer  "usesleft",                  default: 1
    t.datetime "validfrom"
    t.datetime "validuntil"
    t.integer  "mpid"
    t.string   "attribute_1"
  end

  add_index "lime_tokens_916752", ["token"], name: "idx_token_token_916752_8848", using: :btree

  create_table "lime_user_groups", primary_key: "ugid", force: true do |t|
    t.string  "name",        limit: 20, null: false
    t.text    "description",            null: false
    t.integer "owner_id",               null: false
  end

  create_table "lime_user_in_groups", id: false, force: true do |t|
    t.integer "ugid", null: false
    t.integer "uid",  null: false
  end

  create_table "lime_users", primary_key: "uid", force: true do |t|
    t.string   "users_name",           limit: 64,  default: "",        null: false
    t.binary   "password",                                             null: false
    t.string   "full_name",            limit: 50,                      null: false
    t.integer  "parent_id",                                            null: false
    t.string   "lang",                 limit: 20
    t.string   "email",                limit: 254
    t.string   "htmleditormode",       limit: 7,   default: "default"
    t.string   "templateeditormode",   limit: 7,   default: "default", null: false
    t.string   "questionselectormode", limit: 7,   default: "default", null: false
    t.binary   "one_time_pw"
    t.integer  "dateformat",                       default: 1,         null: false
    t.datetime "created"
    t.datetime "modified"
  end

  add_index "lime_users", ["users_name"], name: "lime_users_users_name_key", unique: true, using: :btree

  create_table "meta_attribute_entities", force: true do |t|
    t.text    "entity_type",                                           null: false
    t.text    "meta_attribute_entity_group_group_name",                null: false
    t.integer "edition"
    t.integer "version"
    t.date    "start_date"
    t.date    "stop_date"
    t.boolean "visible",                                default: true
    t.integer "reference_year"
    t.string  "entity_type_fk"
  end

  add_index "meta_attribute_entities", ["entity_type"], name: "ix_meta_attribute_entities", unique: true, using: :btree

  create_table "meta_attribute_entity_groups", force: true do |t|
    t.text    "group_name",                     null: false
    t.text    "parent_table",                   null: false
    t.boolean "visible",         default: true
    t.string  "parent_table_pk"
  end

  create_table "meta_attribute_groups", force: true do |t|
    t.text    "group_name",                  null: false
    t.text    "parent_table",                null: false
    t.boolean "visible",      default: true
  end

  create_table "meta_attribute_questions", force: true do |t|
    t.text    "meta_attribute_entity_entity_type",                null: false
    t.text    "category"
    t.text    "attribute_name"
    t.text    "description"
    t.text    "original_text"
    t.text    "data_type"
    t.text    "options_hash"
    t.boolean "continuous"
    t.boolean "optional"
    t.boolean "visible",                           default: true
    t.text    "short_name"
  end

  create_table "meta_attribute_statistics", id: false, force: true do |t|
    t.integer "meta_attribute_statistic_id", limit: 8,                                           null: false
    t.string  "subset_id",                   limit: nil
    t.string  "entity_schema",               limit: nil
    t.string  "entity_name",                 limit: nil
    t.integer "attribute_index",             limit: 8
    t.string  "attribute_name",              limit: nil
    t.string  "attribute_description",       limit: nil
    t.string  "attribute_data_type",         limit: nil
    t.decimal "count"
    t.decimal "n"
    t.decimal "n_percent",                               precision: 5, scale: 2
    t.decimal "mean"
    t.decimal "stddev"
    t.decimal "min"
    t.decimal "max"
    t.decimal "subset_count"
    t.decimal "subset_n"
    t.decimal "subset_n_percent",                        precision: 5, scale: 2
    t.decimal "subset_mean"
    t.decimal "subset_stddev"
    t.decimal "subset_min"
    t.decimal "subset_max"
    t.decimal "ci_lower"
    t.decimal "ci_upper"
    t.decimal "subset_ci_lower"
    t.decimal "subset_ci_upper"
    t.boolean "is_continuous",                                                   default: false, null: false
  end

  add_index "meta_attribute_statistics", ["subset_id", "entity_schema", "entity_name", "attribute_name"], name: "ix_meta_attribute_statistics", unique: true, using: :btree

  create_table "meta_attribute_values", id: false, force: true do |t|
    t.integer "meta_attribute_value_id",     limit: 8,   null: false
    t.integer "meta_attribute_statistic_id", limit: 8
    t.string  "subset_id",                   limit: nil
    t.string  "entity_schema",               limit: nil
    t.string  "entity_name",                 limit: nil
    t.string  "attribute_name",              limit: nil
    t.decimal "value"
    t.string  "value_description",           limit: nil
    t.decimal "count"
    t.decimal "subset_count"
  end

  add_index "meta_attribute_values", ["meta_attribute_statistic_id"], name: "ix_meta_attribute_statistic_id", using: :btree
  add_index "meta_attribute_values", ["subset_id", "entity_schema", "entity_name", "attribute_name", "value"], name: "ix_meta_attribute_values", unique: true, using: :btree

  create_table "meta_attribute_values", id: false, force: true do |t|
    t.integer "meta_attribute_value_id",     limit: 8,   null: false
    t.integer "meta_attribute_statistic_id", limit: 8
    t.string  "subset_id",                   limit: nil
    t.string  "entity_schema",               limit: nil
    t.string  "entity_name",                 limit: nil
    t.string  "attribute_name",              limit: nil
    t.decimal "value"
    t.string  "value_description",           limit: nil
    t.decimal "count"
    t.decimal "subset_count"
  end

  add_index "meta_attribute_values", ["meta_attribute_statistic_id"], name: "ix_meta_attribute_statistic_id", using: :btree
  add_index "meta_attribute_values", ["subset_id", "entity_schema", "entity_name", "attribute_name", "value"], name: "ix_meta_attribute_values", unique: true, using: :btree

  create_table "p4_clinics", force: true do |t|
    t.string "p4_program_id",       limit: nil, null: false
    t.string "p4_clinic_id",        limit: nil, null: false
    t.string "clinic_abbreviation", limit: nil
  end

  add_index "p4_clinics", ["p4_clinic_id"], name: "u_p4_clinic_id", unique: true, using: :btree

  create_table "p4_programs", force: true do |t|
    t.string "abfm_program_id", limit: nil, null: false
    t.string "p4_program_id",   limit: nil, null: false
    t.string "program_name",    limit: nil
    t.string "alias",           limit: nil
  end

  create_table "p4_resident_clinics", id: false, force: true do |t|
    t.integer "p4_resident_id",             null: false
    t.string  "p4_clinic_id",   limit: nil, null: false
    t.integer "first_year"
    t.integer "last_year"
  end

  create_table "p4_residents", force: true do |t|
    t.string  "p4_program_id",      limit: nil
    t.string  "abfm_last_four",     limit: nil, null: false
    t.string  "abfm_last_four_old", limit: nil
    t.integer "entry_year",                     null: false
    t.integer "graduation_year"
    t.string  "error_codes",        limit: nil
    t.string  "notes",              limit: nil
  end

  create_table "p4_residents_nonconsenting", force: true do |t|
    t.string  "p4_program_id",   limit: nil, null: false
    t.string  "abfm_last_four",  limit: nil, null: false
    t.integer "graduation_year"
  end

  create_table "p4_webads_rankings", id: false, force: true do |t|
    t.string  "p4_program_id",   limit: nil, null: false
    t.integer "ranking_type_id",             null: false
    t.integer "rank",                        null: false
    t.string  "name",            limit: nil, null: false
    t.integer "year",                        null: false
  end

  create_table "role_aggregates", force: true do |t|
    t.string   "email_fieldname"
    t.integer  "lime_survey_sid"
    t.text     "agg_fieldname"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  create_table "user_externals", force: true do |t|
    t.integer "user_id"
    t.string  "ident"
    t.string  "ident_type"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.text     "p4_program_id"
    t.text     "roles"
    t.string   "full_name"
    t.string   "username"
    t.datetime "locked_at"
    t.boolean  "use_ldap"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  create_table "version_notes", force: true do |t|
    t.text     "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "versions", force: true do |t|
    t.string   "item_type",       null: false
    t.integer  "item_id",         null: false
    t.string   "event",           null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
    t.text     "object_changes"
    t.integer  "version_note_id"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree
  add_index "versions", ["version_note_id"], name: "index_versions_on_version_note_id", using: :btree

  create_table "y1_continuity_clinics", id: false, force: true do |t|
    t.string  "p4_program_id",         limit: nil,                          null: false
    t.string  "settingid",             limit: nil,                          null: false
    t.string  "teachingsite",          limit: nil
    t.integer "learningsetting",       limit: 8
    t.string  "learningsettingtxt",    limit: nil
    t.integer "ptassigned",            limit: 8
    t.decimal "pgy1routine",                       precision: 11, scale: 2
    t.decimal "pgy2routine",                       precision: 11, scale: 2
    t.decimal "pgy3routine",                       precision: 11, scale: 2
    t.decimal "pgy4routine",                       precision: 11, scale: 2
    t.decimal "pgy1acute",                         precision: 11, scale: 2
    t.decimal "pgy2acute",                         precision: 11, scale: 2
    t.decimal "pgy3acute",                         precision: 11, scale: 2
    t.decimal "pgy4acute",                         precision: 11, scale: 2
    t.integer "daysnewapptfac",        limit: 8
    t.integer "daysnewapptres",        limit: 8
    t.integer "daysfuapptfac",         limit: 8
    t.integer "daysfuapptres",         limit: 8
    t.integer "daysacuteapptfac",      limit: 8
    t.integer "daysacuteapptres",      limit: 8
    t.integer "numexamrooms",          limit: 8
    t.integer "numptlastyrfac",        limit: 8
    t.integer "numptlastyrres",        limit: 8
    t.decimal "ftefp",                             precision: 11, scale: 2
    t.decimal "ftefmres",                          precision: 11, scale: 2
    t.decimal "fteped",                            precision: 11, scale: 2
    t.decimal "ftepedres",                         precision: 11, scale: 2
    t.decimal "fteim",                             precision: 11, scale: 2
    t.decimal "fteimres",                          precision: 11, scale: 2
    t.decimal "fteob",                             precision: 11, scale: 2
    t.decimal "fteobres",                          precision: 11, scale: 2
    t.decimal "fteotherphys1",                     precision: 11, scale: 2
    t.string  "fteotherphys1txt",      limit: nil
    t.decimal "fteotherphys2",                     precision: 11, scale: 2
    t.string  "fteotherphys2txt",      limit: nil
    t.decimal "fteotherphys3",                     precision: 11, scale: 2
    t.string  "fteotherphys3txt",      limit: nil
    t.decimal "ftenp",                             precision: 11, scale: 2
    t.decimal "ftepa",                             precision: 11, scale: 2
    t.decimal "fternlpn",                          precision: 11, scale: 2
    t.decimal "ftema",                             precision: 11, scale: 2
    t.decimal "fteallied",                         precision: 11, scale: 2
    t.decimal "fteadmin",                          precision: 11, scale: 2
    t.decimal "ftepsych",                          precision: 11, scale: 2
    t.decimal "ftesocial",                         precision: 11, scale: 2
    t.decimal "ftediet",                           precision: 11, scale: 2
    t.decimal "ftepteduc",                         precision: 11, scale: 2
    t.decimal "fteotherspec1",                     precision: 11, scale: 2
    t.string  "fteotherspec1txt",      limit: nil
    t.decimal "fteotherspec2",                     precision: 11, scale: 2
    t.string  "fteotherspec2txt",      limit: nil
    t.decimal "fteotherspec3",                     precision: 11, scale: 2
    t.string  "fteotherspec3txt",      limit: nil
    t.integer "numnp",                 limit: 8
    t.integer "numpa",                 limit: 8
    t.integer "numrnlpn",              limit: 8
    t.integer "numma",                 limit: 8
    t.integer "numallied",             limit: 8
    t.integer "numpsych",              limit: 8
    t.integer "numsocial",             limit: 8
    t.integer "numdiet",               limit: 8
    t.integer "numpteduc",             limit: 8
    t.integer "numotherspec",          limit: 8
    t.string  "numotherspectxt",       limit: nil
    t.integer "integrated",            limit: 8
    t.integer "statemr",               limit: 8
    t.integer "statpaperless",         limit: 8
    t.integer "statremote",            limit: 8
    t.integer "stattranscription",     limit: 8
    t.integer "statscheduling",        limit: 8
    t.integer "statbilling",           limit: 8
    t.integer "statorders",            limit: 8
    t.integer "stathospemr",           limit: 8
    t.integer "statptcommunication",   limit: 8
    t.integer "statprovcommunication", limit: 8
    t.integer "statqa",                limit: 8
    t.integer "statdisregistry",       limit: 8
    t.integer "statprevregistry",      limit: 8
    t.integer "statresearch",          limit: 8
    t.integer "statopenaccess",        limit: 8
    t.integer "statexpandedhrs",       limit: 8
    t.integer "stattelephone",         limit: 8
    t.integer "statnetscheduling",     limit: 8
    t.integer "statsurvey",            limit: 8
    t.integer "statspace",             limit: 8
    t.integer "statparking",           limit: 8
    t.integer "stattransit",           limit: 8
    t.integer "statteams",             limit: 8
    t.integer "statpsych",             limit: 8
    t.integer "statcasemgt",           limit: 8
    t.integer "statpharm",             limit: 8
    t.integer "statgroup",             limit: 8
    t.integer "statptcentered",        limit: 8
    t.string  "emrbrand",              limit: nil
    t.string  "emrversion",            limit: nil
    t.integer "emryrs",                limit: 8
    t.integer "emrmonths",             limit: 8
    t.integer "emrforclinqual",        limit: 8
    t.string  "emrforclinqualtxt",     limit: nil
    t.integer "emrforqualsafe",        limit: 8
    t.string  "emrforqualsafetxt",     limit: nil
    t.string  "noemr",                 limit: nil
  end

  add_index "y1_continuity_clinics", ["settingid"], name: "y1_continuity_clinics_settingid_key", unique: true, using: :btree

  create_table "y1_graduate_responses", force: true do |t|
    t.string  "graduateid",      limit: nil,                          null: false
    t.string  "p4_program_id",   limit: nil,                          null: false
    t.integer "q101a",           limit: 8
    t.integer "q101b",           limit: 8
    t.integer "q101c",           limit: 8
    t.integer "q101d",           limit: 8
    t.integer "q102a",           limit: 8
    t.integer "q102b",           limit: 8
    t.integer "q102c",           limit: 8
    t.integer "q102d",           limit: 8
    t.string  "q102d_other",     limit: nil
    t.integer "q103a",           limit: 8
    t.integer "q103b_1",         limit: 8
    t.integer "q103b_2",         limit: 8
    t.integer "q103b_3",         limit: 8
    t.integer "q103b_4",         limit: 8
    t.integer "q103b_5",         limit: 8
    t.integer "q103b_6",         limit: 8
    t.string  "q103b_other",     limit: nil
    t.string  "q104",            limit: nil
    t.string  "q20.02",          limit: nil
    t.string  "q20.03",          limit: nil
    t.integer "q105",            limit: 8
    t.integer "q106",            limit: 8
    t.integer "q107_1",          limit: 8
    t.integer "q107_2",          limit: 8
    t.integer "q107_3",          limit: 8
    t.integer "q107_4",          limit: 8
    t.integer "q107_5",          limit: 8
    t.integer "q107_6",          limit: 8
    t.string  "q107_other",      limit: nil
    t.integer "q108",            limit: 8
    t.integer "q201",            limit: 8
    t.string  "q201_other",      limit: nil
    t.integer "q202_a",          limit: 8
    t.integer "q202_b",          limit: 8
    t.integer "q202_c",          limit: 8
    t.integer "q202_d",          limit: 8
    t.integer "q202_e",          limit: 8
    t.integer "q202_f",          limit: 8
    t.integer "q202_g",          limit: 8
    t.integer "q202_h",          limit: 8
    t.string  "q202_other",      limit: nil
    t.integer "q4301",           limit: 8
    t.integer "q203",            limit: 8
    t.decimal "q204",                        precision: 11, scale: 2
    t.decimal "q205",                        precision: 11, scale: 2
    t.decimal "q206",                        precision: 11, scale: 2
    t.decimal "q207a",                       precision: 11, scale: 2
    t.decimal "q207b",                       precision: 11, scale: 2
    t.integer "q207c",           limit: 8
    t.decimal "q207d",                       precision: 11, scale: 2
    t.decimal "q207e",                       precision: 11, scale: 2
    t.decimal "q207f",                       precision: 11, scale: 2
    t.string  "q207f_other",     limit: nil
    t.integer "q208",            limit: 8
    t.integer "q301a",           limit: 8
    t.integer "q301b",           limit: 8
    t.integer "q301c",           limit: 8
    t.integer "q301d",           limit: 8
    t.integer "q401",            limit: 8
    t.integer "q402",            limit: 8
    t.integer "q403",            limit: 8
    t.integer "q404",            limit: 8
    t.integer "q405",            limit: 8
    t.integer "q406",            limit: 8
    t.integer "q407",            limit: 8
    t.integer "q408",            limit: 8
    t.integer "q409",            limit: 8
    t.integer "q410",            limit: 8
    t.integer "q411",            limit: 8
    t.integer "q412",            limit: 8
    t.integer "q413",            limit: 8
    t.integer "q414",            limit: 8
    t.integer "q415",            limit: 8
    t.integer "q416",            limit: 8
    t.integer "q417",            limit: 8
    t.integer "q418",            limit: 8
    t.integer "q419",            limit: 8
    t.integer "q420",            limit: 8
    t.integer "q421",            limit: 8
    t.integer "q422",            limit: 8
    t.integer "q423",            limit: 8
    t.integer "q424",            limit: 8
    t.integer "q425",            limit: 8
    t.integer "q426",            limit: 8
    t.integer "q427",            limit: 8
    t.integer "q428",            limit: 8
    t.integer "q501a",           limit: 8
    t.integer "q501a_group",     limit: 8
    t.integer "q501b",           limit: 8
    t.integer "q501b_group",     limit: 8
    t.integer "q501c",           limit: 8
    t.integer "q501c_group",     limit: 8
    t.integer "q501d",           limit: 8
    t.integer "q501d_group",     limit: 8
    t.integer "q501e",           limit: 8
    t.integer "q501e_group",     limit: 8
    t.integer "q501f",           limit: 8
    t.integer "q501f_group",     limit: 8
    t.integer "q501g",           limit: 8
    t.integer "q501g_group",     limit: 8
    t.integer "q502",            limit: 8
    t.integer "q503",            limit: 8
    t.decimal "q503a",                       precision: 11, scale: 2
    t.integer "q503b",           limit: 8
    t.integer "q503_group",      limit: 8
    t.integer "q504",            limit: 8
    t.string  "q504_describe",   limit: nil
    t.integer "q114",            limit: 8
    t.integer "q505_1",          limit: 8
    t.integer "q505_2",          limit: 8
    t.integer "q505_3",          limit: 8
    t.integer "q119.01",         limit: 8
    t.integer "q119.02",         limit: 8
    t.integer "q505_4",          limit: 8
    t.string  "q505_other",      limit: nil
    t.integer "q506a",           limit: 8
    t.integer "q506a_practiced", limit: 8
    t.integer "q506b",           limit: 8
    t.integer "q506b_practiced", limit: 8
    t.integer "q506c",           limit: 8
    t.integer "q506c_practiced", limit: 8
    t.integer "q506d",           limit: 8
    t.integer "q506d_practiced", limit: 8
    t.integer "q506e",           limit: 8
    t.integer "q506e_practiced", limit: 8
    t.integer "q507a",           limit: 8
    t.integer "q507a_practiced", limit: 8
    t.integer "q507b",           limit: 8
    t.integer "q507b_practiced", limit: 8
    t.integer "q507c",           limit: 8
    t.integer "q507c_practiced", limit: 8
    t.integer "q507d",           limit: 8
    t.integer "q507d_practiced", limit: 8
    t.integer "q507e",           limit: 8
    t.integer "q507e_practiced", limit: 8
    t.integer "q507f",           limit: 8
    t.integer "q507f_practiced", limit: 8
    t.integer "q507g",           limit: 8
    t.integer "q507g_practiced", limit: 8
    t.integer "q507h",           limit: 8
    t.integer "q507h_practiced", limit: 8
    t.integer "q507i",           limit: 8
    t.integer "q507i_practiced", limit: 8
    t.integer "q507j",           limit: 8
    t.integer "q507j_practiced", limit: 8
    t.integer "q508a",           limit: 8
    t.integer "q508a_practiced", limit: 8
    t.integer "q508b",           limit: 8
    t.integer "q508b_practiced", limit: 8
    t.integer "q508c",           limit: 8
    t.integer "q508c_practiced", limit: 8
    t.integer "q508d",           limit: 8
    t.integer "q508d_practiced", limit: 8
    t.integer "q508e",           limit: 8
    t.integer "q508e_practiced", limit: 8
    t.integer "q508f",           limit: 8
    t.integer "q508f_practiced", limit: 8
    t.integer "q508g",           limit: 8
    t.integer "q508g_practiced", limit: 8
    t.integer "q509a",           limit: 8
    t.integer "q509a_practiced", limit: 8
    t.integer "q509b",           limit: 8
    t.integer "q509b_practiced", limit: 8
    t.integer "q509c",           limit: 8
    t.integer "q509c_practiced", limit: 8
    t.integer "q510a",           limit: 8
    t.integer "q510a_practiced", limit: 8
    t.integer "q510b",           limit: 8
    t.integer "q510b_practiced", limit: 8
    t.integer "q510c",           limit: 8
    t.integer "q510c_practiced", limit: 8
    t.integer "q510d",           limit: 8
    t.integer "q510d_practiced", limit: 8
    t.integer "q510e",           limit: 8
    t.integer "q510e_practiced", limit: 8
    t.integer "q510f",           limit: 8
    t.integer "q510f_practiced", limit: 8
    t.integer "q510g",           limit: 8
    t.integer "q510g_practiced", limit: 8
    t.integer "q510h",           limit: 8
    t.integer "q510h_practiced", limit: 8
    t.integer "q511a",           limit: 8
    t.integer "q511a_practiced", limit: 8
    t.integer "q511b",           limit: 8
    t.integer "q511b_practiced", limit: 8
    t.integer "q511c",           limit: 8
    t.integer "q511c_practiced", limit: 8
    t.integer "q512a",           limit: 8
    t.integer "q512a_practiced", limit: 8
    t.integer "q512b",           limit: 8
    t.integer "q512b_practiced", limit: 8
    t.integer "q513a",           limit: 8
    t.integer "q513a_practiced", limit: 8
    t.integer "q513b",           limit: 8
    t.integer "q513b_practiced", limit: 8
    t.integer "q513c",           limit: 8
    t.integer "q513c_practiced", limit: 8
    t.integer "q513d",           limit: 8
    t.integer "q513d_practiced", limit: 8
    t.integer "q513e",           limit: 8
    t.integer "q513e_practiced", limit: 8
    t.integer "q514a",           limit: 8
    t.integer "q514a_practiced", limit: 8
    t.integer "q514b",           limit: 8
    t.integer "q514b_practiced", limit: 8
    t.integer "q514c",           limit: 8
    t.integer "q514c_practiced", limit: 8
    t.integer "q514d",           limit: 8
    t.integer "q514d_practiced", limit: 8
    t.integer "q514e",           limit: 8
    t.integer "q514e_practiced", limit: 8
    t.integer "q514f",           limit: 8
    t.integer "q514f_practiced", limit: 8
    t.integer "q514g",           limit: 8
    t.integer "q514g_practiced", limit: 8
    t.integer "q514h",           limit: 8
    t.integer "q514h_practiced", limit: 8
    t.integer "q601a",           limit: 8
    t.integer "q601b",           limit: 8
    t.integer "q601c",           limit: 8
    t.integer "q601d",           limit: 8
    t.integer "q601e",           limit: 8
    t.integer "q602a",           limit: 8
    t.integer "q602b",           limit: 8
    t.integer "q602c",           limit: 8
    t.integer "q602d",           limit: 8
    t.integer "q602e",           limit: 8
    t.integer "q603a",           limit: 8
    t.integer "q603b",           limit: 8
    t.integer "q603c",           limit: 8
    t.integer "q603d",           limit: 8
    t.integer "q603e",           limit: 8
    t.integer "q603f",           limit: 8
    t.integer "q604a",           limit: 8
    t.integer "q604b",           limit: 8
    t.integer "q604c",           limit: 8
    t.integer "q604d",           limit: 8
    t.integer "q605a",           limit: 8
    t.integer "q605b",           limit: 8
    t.integer "q605c",           limit: 8
    t.integer "q605d",           limit: 8
    t.integer "q606a",           limit: 8
    t.integer "q606b",           limit: 8
    t.integer "q606c",           limit: 8
    t.integer "q606d",           limit: 8
    t.integer "q606e",           limit: 8
    t.integer "q606f",           limit: 8
    t.integer "q606g",           limit: 8
    t.integer "q606h",           limit: 8
    t.integer "q606i",           limit: 8
    t.string  "q701",            limit: nil
    t.integer "p4_resident_id"
  end

  create_table "y1_residency_programs", id: false, force: true do |t|
    t.string  "p4_program_id",               limit: nil,                          null: false
    t.integer "id",                          limit: 8,                            null: false
    t.integer "numinterviewed",              limit: 8
    t.integer "numfilledmatchusallo",        limit: 8
    t.integer "numfilledmatchusosteo",       limit: 8
    t.integer "numfilledmatchintl",          limit: 8
    t.integer "numfilledjulyusallo",         limit: 8
    t.integer "numfilledjulyusosteo",        limit: 8
    t.integer "numfilledjulyintl",           limit: 8
    t.integer "resleave",                    limit: 8
    t.integer "resleavepgy1",                limit: 8
    t.integer "resleavepgy2",                limit: 8
    t.integer "resleavepgy3",                limit: 8
    t.integer "resleavepgy4",                limit: 8
    t.integer "pctaafp",                     limit: 8
    t.integer "numqipgy1avail",              limit: 8
    t.integer "numqipgy1res",                limit: 8
    t.integer "numqipgy2avail",              limit: 8
    t.integer "numqipgy2res",                limit: 8
    t.integer "numqipgy3avail",              limit: 8
    t.integer "numqipgy3res",                limit: 8
    t.integer "numqipgy4avail",              limit: 8
    t.integer "numqipgy4res",                limit: 8
    t.integer "numrschpgy1avail",            limit: 8
    t.integer "numrschpgy1res",              limit: 8
    t.integer "numrschpgy2avail",            limit: 8
    t.integer "numrschpgy2res",              limit: 8
    t.integer "numrschpgy3avail",            limit: 8
    t.integer "numrschpgy3res",              limit: 8
    t.integer "numrschpgy4avail",            limit: 8
    t.integer "numrschpgy4res",              limit: 8
    t.decimal "pctpeerreview",                           precision: 11, scale: 2
    t.decimal "pctnonpeerreview",                        precision: 11, scale: 2
    t.decimal "pctpresenting",                           precision: 11, scale: 2
    t.decimal "revgrants",                               precision: 11, scale: 2
    t.decimal "revcharity",                              precision: 11, scale: 2
    t.decimal "revstate",                                precision: 11, scale: 2
    t.decimal "revmedicaredirect",                       precision: 11, scale: 2
    t.decimal "revmedicareindirect",                     precision: 11, scale: 2
    t.decimal "revmedicarehmo",                          precision: 11, scale: 2
    t.decimal "revmedicaredisproportionate",             precision: 11, scale: 2
    t.decimal "revmedicaiddirect",                       precision: 11, scale: 2
    t.decimal "revmedicaidindirect",                     precision: 11, scale: 2
    t.decimal "revhospitalgme",                          precision: 11, scale: 2
    t.decimal "revother",                                precision: 11, scale: 2
    t.string  "revothertxt",                 limit: nil
    t.decimal "revtotal",                                precision: 11, scale: 2
    t.decimal "expfacultyfte",                           precision: 11, scale: 2
    t.decimal "expfacultysalary",                        precision: 11, scale: 2
    t.decimal "expstafffte",                             precision: 11, scale: 2
    t.decimal "expstaffsalary",                          precision: 11, scale: 2
    t.decimal "expbenefits",                             precision: 11, scale: 2
    t.decimal "expcontracts",                            precision: 11, scale: 2
    t.decimal "expequipment",                            precision: 11, scale: 2
    t.decimal "expsupplies",                             precision: 11, scale: 2
    t.decimal "exprent",                                 precision: 11, scale: 2
    t.decimal "expotherresop",                           precision: 11, scale: 2
    t.string  "expotherresoptxt",            limit: nil
    t.decimal "exprecruitment",                          precision: 11, scale: 2
    t.decimal "exphospitalgme",                          precision: 11, scale: 2
    t.decimal "expmalpractice",                          precision: 11, scale: 2
    t.decimal "exphospstepdown",                         precision: 11, scale: 2
    t.decimal "expmedschool",                            precision: 11, scale: 2
    t.decimal "expdme",                                  precision: 11, scale: 2
    t.decimal "expdfm",                                  precision: 11, scale: 2
    t.decimal "expother",                                precision: 11, scale: 2
    t.string  "expothertxt",                 limit: nil
    t.decimal "exptotal",                                precision: 11, scale: 2
    t.integer "ratefacdevel",                limit: 8
    t.integer "ratefacmorale",               limit: 8
    t.integer "rateresmorale",               limit: 8
    t.integer "ratesatisfaction",            limit: 8
    t.decimal "facsalaryexp",                            precision: 11, scale: 2
    t.decimal "volfacultyexp",                           precision: 11, scale: 2
    t.decimal "clinstaffexp",                            precision: 11, scale: 2
    t.decimal "nonclinstaffexp",                         precision: 11, scale: 2
    t.decimal "recruitexp",                              precision: 11, scale: 2
    t.decimal "contractexp",                             precision: 11, scale: 2
    t.decimal "capitalexp",                              precision: 11, scale: 2
    t.decimal "billingisexp",                            precision: 11, scale: 2
    t.decimal "grantsrev",                               precision: 11, scale: 2
    t.decimal "charitablerev",                           precision: 11, scale: 2
    t.decimal "ptcarerev",                               precision: 11, scale: 2
    t.decimal "techancrev",                              precision: 11, scale: 2
  end

  add_index "y1_residency_programs", ["id"], name: "y1_residency_programs_id_key", unique: true, using: :btree

  create_table "y1_resident_responses", force: true do |t|
    t.string  "p4residency_abfm_id",      limit: nil, null: false
    t.string  "p4_program_id",            limit: nil, null: false
    t.integer "abfm_last_four",           limit: 8
    t.integer "abfm_last_four2",          limit: 8
    t.string  "p4resid",                  limit: nil
    t.string  "contclin",                 limit: nil
    t.integer "age",                      limit: 8
    t.integer "gender",                   limit: 8
    t.integer "race_c",                   limit: 8
    t.integer "race_aa",                  limit: 8
    t.integer "race_ap",                  limit: 8
    t.integer "race_in",                  limit: 8
    t.integer "race_o",                   limit: 8
    t.integer "ethnicity",                limit: 8
    t.integer "marital",                  limit: 8
    t.integer "children",                 limit: 8
    t.integer "many",                     limit: 8
    t.integer "medicalafterbs",           limit: 8
    t.integer "yearsbeforemedschool",     limit: 8
    t.integer "usamedschool",             limit: 8
    t.integer "firstgenerationcollege",   limit: 8
    t.integer "firstgenphysician",        limit: 8
    t.integer "firstfamilyphysician",     limit: 8
    t.string  "medgraddate",              limit: nil
    t.integer "programyear",              limit: 8
    t.integer "influence",                limit: 8
    t.integer "masters",                  limit: 8
    t.integer "goals",                    limit: 8
    t.integer "activitiesclinrot",        limit: 8
    t.integer "activitieslectsem",        limit: 8
    t.integer "activitiesservlearn",      limit: 8
    t.integer "facultyteaching",          limit: 8
    t.integer "facultysupervising",       limit: 8
    t.integer "participationjournalclub", limit: 8
    t.integer "participationconferences", limit: 8
    t.integer "feedback",                 limit: 8
    t.integer "evaluatefaculty",          limit: 8
    t.integer "evaluateprogram",          limit: 8
    t.integer "speakfreely",              limit: 8
    t.integer "othertraineesinterfere",   limit: 8
    t.integer "strengthsfacteaching",     limit: 8
    t.integer "strengthsoverallcurr",     limit: 8
    t.integer "strengthscurrchange",      limit: 8
    t.integer "strengthspracchange",      limit: 8
    t.integer "strengthscompetence",      limit: 8
    t.integer "strengthsp4innovations",   limit: 8
    t.integer "strengthsp4implement",     limit: 8
    t.integer "satisfied",                limit: 8
    t.integer "importance1",              limit: 8
    t.integer "importance2",              limit: 8
    t.integer "importance3",              limit: 8
    t.integer "importance4",              limit: 8
    t.integer "importance5",              limit: 8
    t.integer "importance6",              limit: 8
    t.integer "importance7",              limit: 8
    t.integer "importance8",              limit: 8
    t.integer "importance9",              limit: 8
    t.integer "importance10",             limit: 8
    t.integer "importance11",             limit: 8
    t.integer "importance12",             limit: 8
    t.integer "importance13",             limit: 8
    t.integer "importance14",             limit: 8
    t.integer "importance15",             limit: 8
    t.integer "importance16",             limit: 8
    t.integer "importance17",             limit: 8
    t.integer "importance18",             limit: 8
    t.integer "importance19",             limit: 8
    t.integer "importance20",             limit: 8
    t.integer "importance21",             limit: 8
    t.integer "importance22",             limit: 8
    t.integer "importance23",             limit: 8
    t.integer "importance24",             limit: 8
    t.integer "importance25",             limit: 8
    t.integer "importance26",             limit: 8
    t.integer "importance27",             limit: 8
    t.integer "p4_resident_id"
  end

  create_table "y1_webads_responses", id: false, force: true do |t|
    t.string  "p4_program_id",      limit: nil, null: false
    t.integer "pgy1activefulltime", limit: 8
    t.integer "pgy1activeparttime", limit: 8
    t.integer "pgy1completed",      limit: 8
    t.integer "pgy2activefulltime", limit: 8
    t.integer "pgy2activeparttime", limit: 8
    t.integer "pgy2completed",      limit: 8
    t.integer "pgy3activefulltime", limit: 8
    t.integer "pgy3activeparttime", limit: 8
    t.integer "pgy3completed",      limit: 8
    t.integer "pgy4activefulltime", limit: 8
    t.integer "pgy4activeparttime", limit: 8
    t.integer "pgy4completed",      limit: 8
    t.decimal "dailyptsadultyr1"
    t.decimal "dailyptsadultyr2"
    t.decimal "dailyptsadultyr3"
    t.decimal "dailyptsnewbornyr1"
    t.decimal "dailyptsnewbornyr2"
    t.decimal "dailyptsnewbornyr3"
    t.decimal "dailyptspedsyr1"
    t.decimal "dailyptspedsyr2"
    t.decimal "dailyptspedsyr3"
    t.integer "nstcst",             limit: 8
    t.integer "injectionasp",       limit: 8
    t.integer "omt",                limit: 8
    t.integer "castremoval",        limit: 8
    t.integer "circumcision",       limit: 8
    t.integer "treadmill",          limit: 8
    t.integer "ekg",                limit: 8
    t.integer "spirometry",         limit: 8
    t.integer "intubation",         limit: 8
    t.integer "vasectomy",          limit: 8
    t.integer "skinbiopsy",         limit: 8
    t.integer "cryosurgery",        limit: 8
    t.integer "skiniandd",          limit: 8
    t.integer "ingrowntoenail",     limit: 8
    t.integer "lacrepair",          limit: 8
    t.integer "papsmear",           limit: 8
    t.integer "bartholin",          limit: 8
    t.integer "iud",                limit: 8
    t.integer "endometrialbx",      limit: 8
    t.integer "curettage",          limit: 8
    t.integer "colposcopy",         limit: 8
    t.integer "obultrasound",       limit: 8
    t.integer "genitalwarts",       limit: 8
    t.integer "catheter",           limit: 8
    t.integer "cerumenremoval",     limit: 8
    t.integer "eyefb",              limit: 8
    t.integer "ivstart",            limit: 8
  end

  create_table "y2_continuity_clinics", id: false, force: true do |t|
    t.string  "p4_program_id",         limit: nil,                          null: false
    t.string  "settingid",             limit: nil,                          null: false
    t.integer "pgy1",                  limit: 8
    t.integer "pgy2",                  limit: 8
    t.integer "pgy3",                  limit: 8
    t.integer "pgy4",                  limit: 8
    t.integer "totpgy",                limit: 8
    t.integer "ptassigned",            limit: 8
    t.decimal "pgy1routine",                       precision: 11, scale: 2
    t.decimal "pgy2routine",                       precision: 11, scale: 2
    t.decimal "pgy3routine",                       precision: 11, scale: 2
    t.decimal "pgy4routine",                       precision: 11, scale: 2
    t.decimal "pgy1acute",                         precision: 11, scale: 2
    t.decimal "pgy2acute",                         precision: 11, scale: 2
    t.decimal "pgy3acute",                         precision: 11, scale: 2
    t.decimal "pgy4acute",                         precision: 11, scale: 2
    t.decimal "daysnewapptfac",                    precision: 11, scale: 2
    t.decimal "daysnewapptfac3",                   precision: 11, scale: 2
    t.decimal "daysnewapptres",                    precision: 11, scale: 2
    t.decimal "daysnewapptres3",                   precision: 11, scale: 2
    t.decimal "daysfuapptfac",                     precision: 11, scale: 2
    t.decimal "daysfuapptfac3",                    precision: 11, scale: 2
    t.decimal "daysfuapptres",                     precision: 11, scale: 2
    t.decimal "daysfuapptres3",                    precision: 11, scale: 2
    t.decimal "daysacuteapptfac",                  precision: 11, scale: 2
    t.decimal "daysacuteapptfac3",                 precision: 11, scale: 2
    t.decimal "daysacuteapptres",                  precision: 11, scale: 2
    t.decimal "daysacuteapptres3",                 precision: 11, scale: 2
    t.integer "numexamrooms",          limit: 8
    t.decimal "numptfac",                          precision: 11, scale: 2
    t.decimal "numptmid",                          precision: 11, scale: 2
    t.decimal "numptres",                          precision: 11, scale: 2
    t.decimal "ftefp",                             precision: 11, scale: 2
    t.decimal "ftefmres",                          precision: 11, scale: 2
    t.decimal "fteped",                            precision: 11, scale: 2
    t.decimal "ftepedres",                         precision: 11, scale: 2
    t.decimal "fteim",                             precision: 11, scale: 2
    t.decimal "fteimres",                          precision: 11, scale: 2
    t.decimal "fteob",                             precision: 11, scale: 2
    t.decimal "fteobres",                          precision: 11, scale: 2
    t.decimal "fteotherphys1",                     precision: 11, scale: 2
    t.string  "fteotherphys1txt",      limit: nil
    t.decimal "fteotherphys2",                     precision: 11, scale: 2
    t.string  "fteotherphys2txt",      limit: nil
    t.decimal "ftenp",                             precision: 11, scale: 2
    t.decimal "ftepa",                             precision: 11, scale: 2
    t.decimal "fternlpn",                          precision: 11, scale: 2
    t.decimal "ftema",                             precision: 11, scale: 2
    t.decimal "fteallied",                         precision: 11, scale: 2
    t.decimal "fteadmin",                          precision: 11, scale: 2
    t.decimal "ftepsych",                          precision: 11, scale: 2
    t.decimal "ftesocial",                         precision: 11, scale: 2
    t.decimal "ftediet",                           precision: 11, scale: 2
    t.decimal "ftepteduc",                         precision: 11, scale: 2
    t.decimal "fteotherspec1",                     precision: 11, scale: 2
    t.string  "fteotherspec1txt",      limit: nil
    t.decimal "fteotherspec2",                     precision: 11, scale: 2
    t.string  "fteotherspec2txt",      limit: nil
    t.integer "numnp",                 limit: 8
    t.integer "numpa",                 limit: 8
    t.integer "numrnlpn",              limit: 8
    t.integer "numma",                 limit: 8
    t.integer "numallied",             limit: 8
    t.integer "numpsych",              limit: 8
    t.integer "numsocial",             limit: 8
    t.integer "numdiet",               limit: 8
    t.integer "numpteduc",             limit: 8
    t.integer "numotherspec",          limit: 8
    t.string  "numotherspectxt",       limit: nil
    t.integer "integrated",            limit: 8
    t.decimal "owner",                             precision: 11, scale: 2
    t.string  "ownerother",            limit: nil
    t.decimal "male",                              precision: 11, scale: 2
    t.decimal "female",                            precision: 11, scale: 2
    t.string  "gendersource",          limit: nil
    t.decimal "lt3",                               precision: 11, scale: 2
    t.decimal "three",                             precision: 11, scale: 2
    t.decimal "eighteen",                          precision: 11, scale: 2
    t.decimal "twentyfive",                        precision: 11, scale: 2
    t.decimal "fortyfive",                         precision: 11, scale: 2
    t.decimal "sixtyfive",                         precision: 11, scale: 2
    t.decimal "seventyfive",                       precision: 11, scale: 2
    t.string  "agesource",             limit: nil
    t.decimal "hispanic",                          precision: 11, scale: 2
    t.decimal "nonhispanic",                       precision: 11, scale: 2
    t.decimal "indian",                            precision: 11, scale: 2
    t.decimal "asian",                             precision: 11, scale: 2
    t.decimal "black",                             precision: 11, scale: 2
    t.decimal "hawaiian",                          precision: 11, scale: 2
    t.decimal "white",                             precision: 11, scale: 2
    t.decimal "otherrace",                         precision: 11, scale: 2
    t.string  "racesource",            limit: nil
    t.decimal "prepaid",                           precision: 11, scale: 2
    t.decimal "ffs",                               precision: 11, scale: 2
    t.decimal "medicare",                          precision: 11, scale: 2
    t.decimal "medicaid",                          precision: 11, scale: 2
    t.decimal "otherpay",                          precision: 11, scale: 2
    t.decimal "uninsured",                         precision: 11, scale: 2
    t.string  "paysource",             limit: nil
    t.integer "xrays",                 limit: 8
    t.integer "statemr",               limit: 8
    t.integer "statpaperless",         limit: 8
    t.integer "statremote",            limit: 8
    t.integer "stattranscription",     limit: 8
    t.integer "statscheduling",        limit: 8
    t.integer "statbilling",           limit: 8
    t.integer "statorders",            limit: 8
    t.integer "stathospemr",           limit: 8
    t.integer "statptcommunication",   limit: 8
    t.integer "statprovcommunication", limit: 8
    t.integer "statqa",                limit: 8
    t.integer "statdisregistry",       limit: 8
    t.integer "statprevregistry",      limit: 8
    t.integer "statresearch",          limit: 8
    t.integer "statopenaccess",        limit: 8
    t.integer "statexpandedhrs",       limit: 8
    t.integer "stattelephone",         limit: 8
    t.integer "statnetscheduling",     limit: 8
    t.integer "statsurvey",            limit: 8
    t.integer "statspace",             limit: 8
    t.integer "statparking",           limit: 8
    t.integer "stattransit",           limit: 8
    t.integer "statteams",             limit: 8
    t.integer "statpsych",             limit: 8
    t.integer "statcasemgt",           limit: 8
    t.integer "statpharm",             limit: 8
    t.integer "statgroup",             limit: 8
    t.integer "statptcentered",        limit: 8
    t.decimal "emryrs",                            precision: 11, scale: 2
    t.string  "noemrtxt",              limit: nil
    t.integer "emrforsafety",          limit: 8
    t.string  "emrforsafetytxt",       limit: nil
  end

  add_index "y2_continuity_clinics", ["settingid"], name: "y2_continuity_clinics_settingid_key", unique: true, using: :btree

  create_table "y2_graduate_responses", force: true do |t|
    t.integer "graduateid",          limit: 8
    t.string  "p4_program_id",       limit: nil
    t.integer "grad_year",           limit: 8
    t.integer "abfm_last_four",      limit: 8
    t.integer "paper",               limit: 8
    t.integer "finished",            limit: 8
    t.integer "max_slide",           limit: 8
    t.string  "created_at",          limit: nil
    t.string  "updated_at",          limit: nil
    t.integer "q101a",               limit: 8
    t.integer "q101b",               limit: 8
    t.integer "q101c",               limit: 8
    t.integer "q101d",               limit: 8
    t.integer "q102a",               limit: 8
    t.integer "q102b",               limit: 8
    t.integer "q102c",               limit: 8
    t.integer "q102d",               limit: 8
    t.string  "q102d_other",         limit: nil
    t.integer "q103a",               limit: 8
    t.integer "q103b_1",             limit: 8
    t.integer "q103b_2",             limit: 8
    t.integer "q103b_3",             limit: 8
    t.integer "q103b_4",             limit: 8
    t.integer "q103b_5",             limit: 8
    t.integer "q103b_6",             limit: 8
    t.integer "q103b_7",             limit: 8
    t.integer "q103b_8",             limit: 8
    t.integer "q103b_9",             limit: 8
    t.integer "q103b_10",            limit: 8
    t.string  "q103b_other",         limit: nil
    t.string  "q104",                limit: nil
    t.decimal "q105"
    t.integer "q106",                limit: 8
    t.integer "q107_1",              limit: 8
    t.integer "q107_2",              limit: 8
    t.integer "q107_3",              limit: 8
    t.integer "q107_4",              limit: 8
    t.integer "q107_5",              limit: 8
    t.integer "q107_6",              limit: 8
    t.integer "q107_7",              limit: 8
    t.string  "q107_other",          limit: nil
    t.integer "q108",                limit: 8
    t.integer "q201",                limit: 8
    t.string  "q201_other",          limit: nil
    t.integer "q202_a",              limit: 8
    t.integer "q202_b",              limit: 8
    t.integer "q202_c",              limit: 8
    t.integer "q202_d",              limit: 8
    t.integer "q202_e",              limit: 8
    t.integer "q202_f",              limit: 8
    t.integer "q202_g",              limit: 8
    t.integer "q202_h",              limit: 8
    t.string  "q202_other",          limit: nil
    t.integer "q202_none",           limit: 8
    t.integer "q203",                limit: 8
    t.decimal "q204"
    t.integer "q205",                limit: 8
    t.decimal "q206"
    t.decimal "q207a"
    t.decimal "q207b"
    t.decimal "q207c"
    t.decimal "q207d"
    t.decimal "q207e"
    t.decimal "q207f"
    t.integer "q207f_other_present", limit: 8
    t.string  "q207f_other",         limit: nil
    t.integer "q208",                limit: 8
    t.integer "q301a",               limit: 8
    t.integer "q301b",               limit: 8
    t.integer "q301c",               limit: 8
    t.integer "q301d",               limit: 8
    t.integer "q401",                limit: 8
    t.integer "q402",                limit: 8
    t.integer "q403",                limit: 8
    t.integer "q404",                limit: 8
    t.integer "q405",                limit: 8
    t.integer "q406",                limit: 8
    t.integer "q407",                limit: 8
    t.integer "q408",                limit: 8
    t.integer "q409",                limit: 8
    t.integer "q410",                limit: 8
    t.integer "q411",                limit: 8
    t.integer "q412",                limit: 8
    t.integer "q413",                limit: 8
    t.integer "q414",                limit: 8
    t.integer "q415",                limit: 8
    t.integer "q416",                limit: 8
    t.integer "q417",                limit: 8
    t.integer "q418",                limit: 8
    t.integer "q419",                limit: 8
    t.integer "q420",                limit: 8
    t.integer "q421",                limit: 8
    t.integer "q422",                limit: 8
    t.integer "q423",                limit: 8
    t.integer "q424",                limit: 8
    t.integer "q425",                limit: 8
    t.integer "q426",                limit: 8
    t.integer "q427",                limit: 8
    t.integer "q428",                limit: 8
    t.integer "q429",                limit: 8
    t.integer "q430",                limit: 8
    t.integer "q501a",               limit: 8
    t.integer "q501b",               limit: 8
    t.integer "q501c",               limit: 8
    t.integer "q501d",               limit: 8
    t.integer "q501e",               limit: 8
    t.integer "q501f",               limit: 8
    t.integer "q501g",               limit: 8
    t.integer "q502",                limit: 8
    t.integer "q503",                limit: 8
    t.integer "q503_group",          limit: 8
    t.integer "q503a",               limit: 8
    t.integer "q503b",               limit: 8
    t.integer "q504",                limit: 8
    t.string  "q504_describe",       limit: nil
    t.integer "q505_1",              limit: 8
    t.integer "q505_2",              limit: 8
    t.integer "q505_3",              limit: 8
    t.integer "q505_4",              limit: 8
    t.string  "q505_other",          limit: nil
    t.integer "q505_none",           limit: 8
    t.integer "q506a",               limit: 8
    t.integer "q506a_practiced",     limit: 8
    t.integer "q506b",               limit: 8
    t.integer "q506b_practiced",     limit: 8
    t.integer "q506c",               limit: 8
    t.integer "q506c_practiced",     limit: 8
    t.integer "q506d",               limit: 8
    t.integer "q506d_practiced",     limit: 8
    t.integer "q506e",               limit: 8
    t.integer "q506e_practiced",     limit: 8
    t.integer "q507a",               limit: 8
    t.integer "q507a_practiced",     limit: 8
    t.integer "q507b",               limit: 8
    t.integer "q507b_practiced",     limit: 8
    t.integer "q507c",               limit: 8
    t.integer "q507c_practiced",     limit: 8
    t.integer "q507d",               limit: 8
    t.integer "q507d_practiced",     limit: 8
    t.integer "q507e",               limit: 8
    t.integer "q507e_practiced",     limit: 8
    t.integer "q507f",               limit: 8
    t.integer "q507f_practiced",     limit: 8
    t.integer "q507g",               limit: 8
    t.integer "q507g_practiced",     limit: 8
    t.integer "q507h",               limit: 8
    t.integer "q507h_practiced",     limit: 8
    t.integer "q507i",               limit: 8
    t.integer "q507i_practiced",     limit: 8
    t.integer "q507j",               limit: 8
    t.integer "q507j_practiced",     limit: 8
    t.integer "q508a",               limit: 8
    t.integer "q508a_practiced",     limit: 8
    t.integer "q508b",               limit: 8
    t.integer "q508b_practiced",     limit: 8
    t.integer "q508c",               limit: 8
    t.integer "q508c_practiced",     limit: 8
    t.integer "q508d",               limit: 8
    t.integer "q508d_practiced",     limit: 8
    t.integer "q508e",               limit: 8
    t.integer "q508e_practiced",     limit: 8
    t.integer "q508f",               limit: 8
    t.integer "q508f_practiced",     limit: 8
    t.integer "q508g",               limit: 8
    t.integer "q508g_practiced",     limit: 8
    t.integer "q509a",               limit: 8
    t.integer "q509a_practiced",     limit: 8
    t.integer "q509b",               limit: 8
    t.integer "q509b_practiced",     limit: 8
    t.integer "q509c",               limit: 8
    t.integer "q509c_practiced",     limit: 8
    t.integer "q510a",               limit: 8
    t.integer "q510a_practiced",     limit: 8
    t.integer "q510b",               limit: 8
    t.integer "q510b_practiced",     limit: 8
    t.integer "q510c",               limit: 8
    t.integer "q510c_practiced",     limit: 8
    t.integer "q510d",               limit: 8
    t.integer "q510d_practiced",     limit: 8
    t.integer "q510e",               limit: 8
    t.integer "q510e_practiced",     limit: 8
    t.integer "q510f",               limit: 8
    t.integer "q510f_practiced",     limit: 8
    t.integer "q510g",               limit: 8
    t.integer "q510g_practiced",     limit: 8
    t.integer "q510h",               limit: 8
    t.integer "q510h_practiced",     limit: 8
    t.integer "q511a",               limit: 8
    t.integer "q511a_practiced",     limit: 8
    t.integer "q511b",               limit: 8
    t.integer "q511b_practiced",     limit: 8
    t.integer "q511c",               limit: 8
    t.integer "q511c_practiced",     limit: 8
    t.integer "q512a",               limit: 8
    t.integer "q512a_practiced",     limit: 8
    t.integer "q512b",               limit: 8
    t.integer "q512b_practiced",     limit: 8
    t.integer "q513a",               limit: 8
    t.integer "q513a_practiced",     limit: 8
    t.integer "q513b",               limit: 8
    t.integer "q513b_practiced",     limit: 8
    t.integer "q513c",               limit: 8
    t.integer "q513c_practiced",     limit: 8
    t.integer "q513d",               limit: 8
    t.integer "q513d_practiced",     limit: 8
    t.integer "q513e",               limit: 8
    t.integer "q513e_practiced",     limit: 8
    t.integer "q514a",               limit: 8
    t.integer "q514a_practiced",     limit: 8
    t.integer "q514b",               limit: 8
    t.integer "q514b_practiced",     limit: 8
    t.integer "q514c",               limit: 8
    t.integer "q514c_practiced",     limit: 8
    t.integer "q514d",               limit: 8
    t.integer "q514d_practiced",     limit: 8
    t.integer "q514e",               limit: 8
    t.integer "q514e_practiced",     limit: 8
    t.integer "q514f",               limit: 8
    t.integer "q514f_practiced",     limit: 8
    t.integer "q514g",               limit: 8
    t.integer "q514g_practiced",     limit: 8
    t.integer "q514h",               limit: 8
    t.integer "q514h_practiced",     limit: 8
    t.integer "q514i",               limit: 8
    t.integer "q514i_practiced",     limit: 8
    t.integer "q514j",               limit: 8
    t.integer "q514j_practiced",     limit: 8
    t.integer "q601a",               limit: 8
    t.integer "q601a_practiced",     limit: 8
    t.integer "q601b",               limit: 8
    t.integer "q601b_practiced",     limit: 8
    t.integer "q601c",               limit: 8
    t.integer "q601c_practiced",     limit: 8
    t.integer "q601d",               limit: 8
    t.integer "q601d_practiced",     limit: 8
    t.integer "q601e",               limit: 8
    t.integer "q601e_practiced",     limit: 8
    t.integer "q602a",               limit: 8
    t.integer "q602a_practiced",     limit: 8
    t.integer "q602b",               limit: 8
    t.integer "q602b_practiced",     limit: 8
    t.integer "q602c",               limit: 8
    t.integer "q602c_practiced",     limit: 8
    t.integer "q602d",               limit: 8
    t.integer "q602d_practiced",     limit: 8
    t.integer "q602e",               limit: 8
    t.integer "q602e_practiced",     limit: 8
    t.integer "q603a",               limit: 8
    t.integer "q603a_practiced",     limit: 8
    t.integer "q603b",               limit: 8
    t.integer "q603b_practiced",     limit: 8
    t.integer "q603c",               limit: 8
    t.integer "q603c_practiced",     limit: 8
    t.integer "q603d",               limit: 8
    t.integer "q603d_practiced",     limit: 8
    t.integer "q603e",               limit: 8
    t.integer "q603e_practiced",     limit: 8
    t.integer "q603f",               limit: 8
    t.integer "q603f_practiced",     limit: 8
    t.integer "q604a",               limit: 8
    t.integer "q604a_practiced",     limit: 8
    t.integer "q604b",               limit: 8
    t.integer "q604b_practiced",     limit: 8
    t.integer "q604c",               limit: 8
    t.integer "q604c_practiced",     limit: 8
    t.integer "q604d",               limit: 8
    t.integer "q604d_practiced",     limit: 8
    t.integer "q605a",               limit: 8
    t.integer "q605a_practiced",     limit: 8
    t.integer "q605b",               limit: 8
    t.integer "q605b_practiced",     limit: 8
    t.integer "q606a",               limit: 8
    t.integer "q606a_practiced",     limit: 8
    t.integer "q606b",               limit: 8
    t.integer "q606b_practiced",     limit: 8
    t.integer "q606c",               limit: 8
    t.integer "q606c_practiced",     limit: 8
    t.integer "q606d",               limit: 8
    t.integer "q606d_practiced",     limit: 8
    t.integer "q606e",               limit: 8
    t.integer "q606e_practiced",     limit: 8
    t.integer "q606f",               limit: 8
    t.integer "q606f_practiced",     limit: 8
    t.integer "q606g",               limit: 8
    t.integer "q606g_practiced",     limit: 8
    t.integer "q606h",               limit: 8
    t.integer "q606h_practiced",     limit: 8
    t.integer "q606i",               limit: 8
    t.integer "q606i_practiced",     limit: 8
    t.string  "q701",                limit: nil
    t.integer "p4_resident_id"
  end

  create_table "y2_residency_programs", id: false, force: true do |t|
    t.string  "abfmresidencyid",   limit: nil,                          null: false
    t.string  "p4_program_id",     limit: nil,                          null: false
    t.integer "resleave",          limit: 8
    t.integer "resleavepgy1",      limit: 8
    t.integer "resleavepgy2",      limit: 8
    t.integer "resleavepgy3",      limit: 8
    t.integer "resleavepgy4",      limit: 8
    t.integer "facleave",          limit: 8
    t.string  "progdir",           limit: nil
    t.string  "siteeval",          limit: nil
    t.string  "assocprogdir",      limit: nil
    t.string  "rescoord",          limit: nil
    t.integer "otherfacleave1",    limit: 8
    t.string  "otherfacleave1txt", limit: nil
    t.integer "otherfacleave2",    limit: 8
    t.string  "otherfacleave2txt", limit: nil
    t.integer "numqipgy1res",      limit: 8
    t.integer "numqipgy2res",      limit: 8
    t.integer "numqipgy3res",      limit: 8
    t.integer "numqipgy4res",      limit: 8
    t.integer "numrschpgy1res",    limit: 8
    t.integer "numrschpgy2res",    limit: 8
    t.integer "numrschpgy3res",    limit: 8
    t.integer "numrschpgy4res",    limit: 8
    t.decimal "pctpeerreview",                 precision: 11, scale: 2
    t.decimal "pctnonpeerreview",              precision: 11, scale: 2
    t.decimal "pctpresenting",                 precision: 11, scale: 2
    t.integer "rps",               limit: 8
    t.integer "ratefacdevel",      limit: 8
    t.integer "ratefacmorale",     limit: 8
    t.integer "rateresmorale",     limit: 8
    t.integer "ratesatisfaction",  limit: 8
    t.decimal "facsalaryexp",                  precision: 11, scale: 2
    t.decimal "volfacultyexp",                 precision: 11, scale: 2
    t.decimal "clinstaffexp",                  precision: 11, scale: 2
    t.decimal "nonclinstaffexp",               precision: 11, scale: 2
    t.decimal "recruitexp",                    precision: 11, scale: 2
    t.decimal "contractexp",                   precision: 11, scale: 2
    t.decimal "capitalexp",                    precision: 11, scale: 2
    t.decimal "billingisexp",                  precision: 11, scale: 2
    t.decimal "grantsrev",                     precision: 11, scale: 2
    t.decimal "charitablerev",                 precision: 11, scale: 2
    t.decimal "ptcarerev",                     precision: 11, scale: 2
    t.decimal "techancrev",                    precision: 11, scale: 2
  end

  create_table "y2_resident_responses", force: true do |t|
    t.string  "p4residency_abfm_id",      limit: nil, null: false
    t.string  "p4_program_id",            limit: nil, null: false
    t.integer "abfm_last_four",           limit: 8
    t.string  "p4resid",                  limit: nil
    t.string  "contclin",                 limit: nil
    t.integer "age",                      limit: 8
    t.integer "gender",                   limit: 8
    t.integer "race_c",                   limit: 8
    t.integer "race_aa",                  limit: 8
    t.integer "race_ap",                  limit: 8
    t.integer "race_in",                  limit: 8
    t.integer "race_o",                   limit: 8
    t.string  "raceothertxt",             limit: nil
    t.integer "ethnicity",                limit: 8
    t.integer "marital",                  limit: 8
    t.integer "children",                 limit: 8
    t.integer "many",                     limit: 8
    t.integer "medicalafterbs",           limit: 8
    t.integer "yearsbeforemedschool",     limit: 8
    t.string  "describebeforemed",        limit: nil
    t.integer "usamedschool",             limit: 8
    t.integer "firstgenerationcollege",   limit: 8
    t.integer "firstgenphysician",        limit: 8
    t.integer "firstfamilyphysician",     limit: 8
    t.string  "medgraddate",              limit: nil
    t.integer "programyear",              limit: 8
    t.string  "otherprogramyear",         limit: nil
    t.integer "influence",                limit: 8
    t.integer "masters",                  limit: 8
    t.string  "mastersdegree",            limit: nil
    t.string  "mastersdegreeother",       limit: nil
    t.integer "goals",                    limit: 8
    t.integer "facultyteaching",          limit: 8
    t.integer "facultysupervising",       limit: 8
    t.integer "participationjournalclub", limit: 8
    t.integer "participationconferences", limit: 8
    t.integer "feedback",                 limit: 8
    t.integer "evaluatefaculty",          limit: 8
    t.integer "evaluateprogram",          limit: 8
    t.integer "speakfreely",              limit: 8
    t.integer "othertraineesinterfere",   limit: 8
    t.integer "satisfied",                limit: 8
    t.integer "strengthsfacteaching",     limit: 8
    t.integer "strengthsoverallcurr",     limit: 8
    t.integer "strengthscurrchange",      limit: 8
    t.integer "strengthspracchange",      limit: 8
    t.integer "strengthscompetence",      limit: 8
    t.integer "strengthsp4innovations",   limit: 8
    t.integer "strengthsp4implement",     limit: 8
    t.integer "importance1",              limit: 8
    t.integer "importance2",              limit: 8
    t.integer "importance3",              limit: 8
    t.integer "importance4",              limit: 8
    t.integer "importance5",              limit: 8
    t.integer "importance6",              limit: 8
    t.integer "importance7",              limit: 8
    t.integer "importance8",              limit: 8
    t.integer "importance9",              limit: 8
    t.integer "importance10",             limit: 8
    t.integer "importance11",             limit: 8
    t.integer "importance12",             limit: 8
    t.integer "importance13",             limit: 8
    t.integer "importance14",             limit: 8
    t.integer "importance15",             limit: 8
    t.integer "importance16",             limit: 8
    t.integer "importance17",             limit: 8
    t.integer "importance18",             limit: 8
    t.integer "importance19",             limit: 8
    t.integer "importance20",             limit: 8
    t.integer "importance21",             limit: 8
    t.integer "importance22",             limit: 8
    t.integer "importance23",             limit: 8
    t.integer "importance24",             limit: 8
    t.integer "importance25",             limit: 8
    t.integer "importance26",             limit: 8
    t.integer "importance27",             limit: 8
    t.integer "p4_resident_id"
  end

  create_table "y2_webads_responses", id: false, force: true do |t|
    t.string  "p4_program_id",      limit: nil, null: false
    t.string  "abfmresidencyid",    limit: nil, null: false
    t.string  "id",                 limit: nil, null: false
    t.integer "pgy1activefulltime", limit: 8
    t.integer "pgy1activeparttime", limit: 8
    t.integer "pgy1completed",      limit: 8
    t.integer "pgy2activefulltime", limit: 8
    t.integer "pgy2activeparttime", limit: 8
    t.integer "pgy2completed",      limit: 8
    t.integer "pgy3activefulltime", limit: 8
    t.integer "pgy3activeparttime", limit: 8
    t.integer "pgy3completed",      limit: 8
    t.integer "pgy4activefulltime", limit: 8
    t.integer "pgy4activeparttime", limit: 8
    t.integer "pgy4completed",      limit: 8
    t.decimal "dailyptsadultyr1"
    t.decimal "dailyptsadultyr2"
    t.decimal "dailyptsadultyr3"
    t.decimal "dailyptsnewbornyr1"
    t.decimal "dailyptsnewbornyr2"
    t.decimal "dailyptsnewbornyr3"
    t.decimal "dailyptspedsyr1"
    t.decimal "dailyptspedsyr2"
    t.decimal "dailyptspedsyr3"
  end

  create_table "y3_continuity_clinics", id: false, force: true do |t|
    t.string  "p4_program_id",             limit: nil, null: false
    t.string  "settingid",                 limit: nil, null: false
    t.integer "id",                        limit: 8,   null: false
    t.integer "participant_id",            limit: 8
    t.string  "created_at",                limit: nil
    t.string  "updated_at",                limit: nil
    t.integer "pgy1",                      limit: 8
    t.integer "pgy2",                      limit: 8
    t.integer "pgy3",                      limit: 8
    t.integer "pgy4",                      limit: 8
    t.integer "nopgy4",                    limit: 8
    t.integer "ptassigned",                limit: 8
    t.decimal "pgy1routine"
    t.decimal "pgy2routine"
    t.decimal "pgy3routine"
    t.decimal "pgy4routine"
    t.decimal "pgy1acute"
    t.decimal "pgy2acute"
    t.decimal "pgy3acute"
    t.decimal "pgy4acute"
    t.decimal "daysnewapptfac3"
    t.integer "daysnewapptfac3_unknown",   limit: 8
    t.decimal "daysnewapptres3"
    t.integer "daysnewapptres3_unknown",   limit: 8
    t.decimal "daysfuapptfac3"
    t.integer "daysfuapptfac3_unknown",    limit: 8
    t.decimal "daysfuapptres3"
    t.integer "daysfuapptres3_unknown",    limit: 8
    t.decimal "daysacuteapptfac3"
    t.integer "daysacuteapptfac3_unknown", limit: 8
    t.decimal "daysacuteapptres3"
    t.integer "daysacuteapptres3_unknown", limit: 8
    t.integer "numexamrooms",              limit: 8
    t.integer "numptfac",                  limit: 8
    t.integer "numptmid",                  limit: 8
    t.integer "numptres",                  limit: 8
    t.decimal "ftefp"
    t.decimal "ftefmres"
    t.decimal "fteped"
    t.decimal "ftepedres"
    t.decimal "fteim"
    t.decimal "fteimres"
    t.decimal "fteob"
    t.decimal "fteobres"
    t.integer "fteotherphys1_present",     limit: 8
    t.decimal "fteotherphys1"
    t.text    "fteotherphys1txt"
    t.integer "fteotherphys2_present",     limit: 8
    t.decimal "fteotherphys2"
    t.text    "fteotherphys2txt"
    t.decimal "ftenp"
    t.decimal "ftepa"
    t.decimal "fternlpn"
    t.decimal "ftema"
    t.decimal "fteallied"
    t.decimal "fteadmin"
    t.decimal "ftepsych"
    t.decimal "ftesocial"
    t.decimal "ftediet"
    t.decimal "ftepteduc"
    t.decimal "ftepharm"
    t.integer "fteotherspec1_present",     limit: 8
    t.decimal "fteotherspec1"
    t.text    "fteotherspec1txt"
    t.integer "fteotherspec2_present",     limit: 8
    t.decimal "fteotherspec2"
    t.text    "fteotherspec2txt"
    t.integer "numnp",                     limit: 8
    t.integer "numpa",                     limit: 8
    t.integer "numrnlpn",                  limit: 8
    t.integer "numma",                     limit: 8
    t.integer "numallied",                 limit: 8
    t.integer "numpsych",                  limit: 8
    t.integer "numsocial",                 limit: 8
    t.integer "numdiet",                   limit: 8
    t.integer "numpteduc",                 limit: 8
    t.decimal "numotherspec_present"
    t.integer "numotherspec",              limit: 8
    t.text    "numotherspectxt"
    t.integer "integrated",                limit: 8
    t.integer "owner",                     limit: 8
    t.text    "ownerother"
    t.decimal "male"
    t.decimal "female"
    t.text    "gendersource"
    t.decimal "lt3"
    t.decimal "three"
    t.decimal "eighteen"
    t.decimal "twentyfive"
    t.decimal "fortyfive"
    t.decimal "sixtyfive"
    t.decimal "seventyfive"
    t.text    "agesource"
    t.decimal "hispanic"
    t.decimal "nonhispanic"
    t.text    "ethnicitysource"
    t.decimal "indian"
    t.decimal "asian"
    t.decimal "black"
    t.decimal "hawaiian"
    t.decimal "white"
    t.integer "otherrace_present",         limit: 8
    t.decimal "otherrace"
    t.text    "otherracetxt"
    t.text    "racesource"
    t.decimal "prepaid"
    t.decimal "ffs"
    t.decimal "medicare"
    t.decimal "medicaid"
    t.integer "otherpay_present",          limit: 8
    t.decimal "otherpay"
    t.text    "otherpaytxt"
    t.decimal "uninsured"
    t.text    "paysource"
    t.integer "xrays",                     limit: 8
    t.integer "statemr",                   limit: 8
    t.integer "statpaperless",             limit: 8
    t.integer "statremote",                limit: 8
    t.integer "stattranscription",         limit: 8
    t.integer "statscheduling",            limit: 8
    t.integer "statbilling",               limit: 8
    t.integer "statorders",                limit: 8
    t.integer "stathospemr",               limit: 8
    t.integer "statptcommunication",       limit: 8
    t.integer "statprovcommunication",     limit: 8
    t.integer "statqa",                    limit: 8
    t.integer "statdisregistry",           limit: 8
    t.integer "statprevregistry",          limit: 8
    t.integer "statresearch",              limit: 8
    t.integer "statopenaccess",            limit: 8
    t.integer "statexpandedhrs",           limit: 8
    t.integer "stattelephone",             limit: 8
    t.integer "statnetscheduling",         limit: 8
    t.integer "statsurvey",                limit: 8
    t.integer "statspace",                 limit: 8
    t.integer "statparking",               limit: 8
    t.integer "stattransit",               limit: 8
    t.integer "statteams",                 limit: 8
    t.integer "statpsych",                 limit: 8
    t.integer "statcasemgt",               limit: 8
    t.integer "statpharm",                 limit: 8
    t.integer "statgroup",                 limit: 8
    t.integer "statptcentered",            limit: 8
    t.integer "emrimplemented",            limit: 8
    t.decimal "emryears"
    t.text    "emrexplain"
    t.integer "emrptsafety",               limit: 8
    t.text    "emrptsafetytxt"
  end

  add_index "y3_continuity_clinics", ["settingid"], name: "y3_continuity_clinics_settingid_key", unique: true, using: :btree

  create_table "y3_graduate_responses", force: true do |t|
    t.integer "graduateid",          limit: 8
    t.string  "p4_program_id",       limit: nil
    t.integer "grad_year",           limit: 8
    t.integer "abfm_last_four",      limit: 8
    t.integer "paper",               limit: 8
    t.integer "finished",            limit: 8
    t.integer "max_slide",           limit: 8
    t.string  "created_at",          limit: nil
    t.string  "updated_at",          limit: nil
    t.integer "q101a",               limit: 8
    t.integer "q101b",               limit: 8
    t.integer "q101c",               limit: 8
    t.integer "q101d",               limit: 8
    t.integer "q102a",               limit: 8
    t.integer "q102b",               limit: 8
    t.integer "q102c",               limit: 8
    t.integer "q102d",               limit: 8
    t.string  "q102d_other",         limit: nil
    t.integer "q103a",               limit: 8
    t.integer "q103b_1",             limit: 8
    t.integer "q103b_2",             limit: 8
    t.integer "q103b_3",             limit: 8
    t.integer "q103b_4",             limit: 8
    t.integer "q103b_5",             limit: 8
    t.integer "q103b_6",             limit: 8
    t.integer "q103b_7",             limit: 8
    t.integer "q103b_8",             limit: 8
    t.integer "q103b_9",             limit: 8
    t.integer "q103b_10",            limit: 8
    t.string  "q103b_other",         limit: nil
    t.string  "q104",                limit: nil
    t.decimal "q105"
    t.integer "q106",                limit: 8
    t.integer "q107_1",              limit: 8
    t.integer "q107_2",              limit: 8
    t.integer "q107_3",              limit: 8
    t.integer "q107_4",              limit: 8
    t.integer "q107_5",              limit: 8
    t.integer "q107_6",              limit: 8
    t.integer "q107_7",              limit: 8
    t.string  "q107_other",          limit: nil
    t.integer "q108",                limit: 8
    t.integer "q201",                limit: 8
    t.string  "q201_other",          limit: nil
    t.integer "q202_a",              limit: 8
    t.integer "q202_b",              limit: 8
    t.integer "q202_c",              limit: 8
    t.integer "q202_d",              limit: 8
    t.integer "q202_e",              limit: 8
    t.integer "q202_f",              limit: 8
    t.integer "q202_g",              limit: 8
    t.integer "q202_h",              limit: 8
    t.string  "q202_other",          limit: nil
    t.integer "q202_none",           limit: 8
    t.integer "q203",                limit: 8
    t.decimal "q204"
    t.integer "q205",                limit: 8
    t.decimal "q206"
    t.decimal "q207a"
    t.decimal "q207b"
    t.decimal "q207c"
    t.decimal "q207d"
    t.decimal "q207e"
    t.decimal "q207f"
    t.integer "q207f_other_present", limit: 8
    t.string  "q207f_other",         limit: nil
    t.integer "q208",                limit: 8
    t.integer "q301a",               limit: 8
    t.integer "q301b",               limit: 8
    t.integer "q301c",               limit: 8
    t.integer "q301d",               limit: 8
    t.integer "q401",                limit: 8
    t.integer "q402",                limit: 8
    t.integer "q403",                limit: 8
    t.integer "q404",                limit: 8
    t.integer "q405",                limit: 8
    t.integer "q406",                limit: 8
    t.integer "q407",                limit: 8
    t.integer "q408",                limit: 8
    t.integer "q409",                limit: 8
    t.integer "q410",                limit: 8
    t.integer "q411",                limit: 8
    t.integer "q412",                limit: 8
    t.integer "q413",                limit: 8
    t.integer "q414",                limit: 8
    t.integer "q415",                limit: 8
    t.integer "q416",                limit: 8
    t.integer "q417",                limit: 8
    t.integer "q418",                limit: 8
    t.integer "q419",                limit: 8
    t.integer "q420",                limit: 8
    t.integer "q421",                limit: 8
    t.integer "q422",                limit: 8
    t.integer "q423",                limit: 8
    t.integer "q424",                limit: 8
    t.integer "q425",                limit: 8
    t.integer "q426",                limit: 8
    t.integer "q427",                limit: 8
    t.integer "q428",                limit: 8
    t.integer "q429",                limit: 8
    t.integer "q430",                limit: 8
    t.integer "q501a",               limit: 8
    t.integer "q501b",               limit: 8
    t.integer "q501c",               limit: 8
    t.integer "q501d",               limit: 8
    t.integer "q501e",               limit: 8
    t.integer "q501f",               limit: 8
    t.integer "q501g",               limit: 8
    t.integer "q502",                limit: 8
    t.integer "q503",                limit: 8
    t.integer "q503_group",          limit: 8
    t.integer "q503a",               limit: 8
    t.integer "q503b",               limit: 8
    t.integer "q504",                limit: 8
    t.string  "q504_describe",       limit: nil
    t.integer "q505_1",              limit: 8
    t.integer "q505_2",              limit: 8
    t.integer "q505_3",              limit: 8
    t.integer "q505_4",              limit: 8
    t.string  "q505_other",          limit: nil
    t.integer "q505_none",           limit: 8
    t.integer "q506a",               limit: 8
    t.integer "q506a_practiced",     limit: 8
    t.integer "q506b",               limit: 8
    t.integer "q506b_practiced",     limit: 8
    t.integer "q506c",               limit: 8
    t.integer "q506c_practiced",     limit: 8
    t.integer "q506d",               limit: 8
    t.integer "q506d_practiced",     limit: 8
    t.integer "q506e",               limit: 8
    t.integer "q506e_practiced",     limit: 8
    t.integer "q507a",               limit: 8
    t.integer "q507a_practiced",     limit: 8
    t.integer "q507b",               limit: 8
    t.integer "q507b_practiced",     limit: 8
    t.integer "q507c",               limit: 8
    t.integer "q507c_practiced",     limit: 8
    t.integer "q507d",               limit: 8
    t.integer "q507d_practiced",     limit: 8
    t.integer "q507e",               limit: 8
    t.integer "q507e_practiced",     limit: 8
    t.integer "q507f",               limit: 8
    t.integer "q507f_practiced",     limit: 8
    t.integer "q507g",               limit: 8
    t.integer "q507g_practiced",     limit: 8
    t.integer "q507h",               limit: 8
    t.integer "q507h_practiced",     limit: 8
    t.integer "q507i",               limit: 8
    t.integer "q507i_practiced",     limit: 8
    t.integer "q507j",               limit: 8
    t.integer "q507j_practiced",     limit: 8
    t.integer "q508a",               limit: 8
    t.integer "q508a_practiced",     limit: 8
    t.integer "q508b",               limit: 8
    t.integer "q508b_practiced",     limit: 8
    t.integer "q508c",               limit: 8
    t.integer "q508c_practiced",     limit: 8
    t.integer "q508d",               limit: 8
    t.integer "q508d_practiced",     limit: 8
    t.integer "q508e",               limit: 8
    t.integer "q508e_practiced",     limit: 8
    t.integer "q508f",               limit: 8
    t.integer "q508f_practiced",     limit: 8
    t.integer "q508g",               limit: 8
    t.integer "q508g_practiced",     limit: 8
    t.integer "q509a",               limit: 8
    t.integer "q509a_practiced",     limit: 8
    t.integer "q509b",               limit: 8
    t.integer "q509b_practiced",     limit: 8
    t.integer "q509c",               limit: 8
    t.integer "q509c_practiced",     limit: 8
    t.integer "q510a",               limit: 8
    t.integer "q510a_practiced",     limit: 8
    t.integer "q510b",               limit: 8
    t.integer "q510b_practiced",     limit: 8
    t.integer "q510c",               limit: 8
    t.integer "q510c_practiced",     limit: 8
    t.integer "q510d",               limit: 8
    t.integer "q510d_practiced",     limit: 8
    t.integer "q510e",               limit: 8
    t.integer "q510e_practiced",     limit: 8
    t.integer "q510f",               limit: 8
    t.integer "q510f_practiced",     limit: 8
    t.integer "q510g",               limit: 8
    t.integer "q510g_practiced",     limit: 8
    t.integer "q510h",               limit: 8
    t.integer "q510h_practiced",     limit: 8
    t.integer "q511a",               limit: 8
    t.integer "q511a_practiced",     limit: 8
    t.integer "q511b",               limit: 8
    t.integer "q511b_practiced",     limit: 8
    t.integer "q511c",               limit: 8
    t.integer "q511c_practiced",     limit: 8
    t.integer "q512a",               limit: 8
    t.integer "q512a_practiced",     limit: 8
    t.integer "q512b",               limit: 8
    t.integer "q512b_practiced",     limit: 8
    t.integer "q513a",               limit: 8
    t.integer "q513a_practiced",     limit: 8
    t.integer "q513b",               limit: 8
    t.integer "q513b_practiced",     limit: 8
    t.integer "q513c",               limit: 8
    t.integer "q513c_practiced",     limit: 8
    t.integer "q513d",               limit: 8
    t.integer "q513d_practiced",     limit: 8
    t.integer "q513e",               limit: 8
    t.integer "q513e_practiced",     limit: 8
    t.integer "q514a",               limit: 8
    t.integer "q514a_practiced",     limit: 8
    t.integer "q514b",               limit: 8
    t.integer "q514b_practiced",     limit: 8
    t.integer "q514c",               limit: 8
    t.integer "q514c_practiced",     limit: 8
    t.integer "q514d",               limit: 8
    t.integer "q514d_practiced",     limit: 8
    t.integer "q514e",               limit: 8
    t.integer "q514e_practiced",     limit: 8
    t.integer "q514f",               limit: 8
    t.integer "q514f_practiced",     limit: 8
    t.integer "q514g",               limit: 8
    t.integer "q514g_practiced",     limit: 8
    t.integer "q514h",               limit: 8
    t.integer "q514h_practiced",     limit: 8
    t.integer "q514i",               limit: 8
    t.integer "q514i_practiced",     limit: 8
    t.integer "q514j",               limit: 8
    t.integer "q514j_practiced",     limit: 8
    t.integer "q601a",               limit: 8
    t.integer "q601a_practiced",     limit: 8
    t.integer "q601b",               limit: 8
    t.integer "q601b_practiced",     limit: 8
    t.integer "q601c",               limit: 8
    t.integer "q601c_practiced",     limit: 8
    t.integer "q601d",               limit: 8
    t.integer "q601d_practiced",     limit: 8
    t.integer "q601e",               limit: 8
    t.integer "q601e_practiced",     limit: 8
    t.integer "q602a",               limit: 8
    t.integer "q602a_practiced",     limit: 8
    t.integer "q602b",               limit: 8
    t.integer "q602b_practiced",     limit: 8
    t.integer "q602c",               limit: 8
    t.integer "q602c_practiced",     limit: 8
    t.integer "q602d",               limit: 8
    t.integer "q602d_practiced",     limit: 8
    t.integer "q602e",               limit: 8
    t.integer "q602e_practiced",     limit: 8
    t.integer "q603a",               limit: 8
    t.integer "q603a_practiced",     limit: 8
    t.integer "q603b",               limit: 8
    t.integer "q603b_practiced",     limit: 8
    t.integer "q603c",               limit: 8
    t.integer "q603c_practiced",     limit: 8
    t.integer "q603d",               limit: 8
    t.integer "q603d_practiced",     limit: 8
    t.integer "q603e",               limit: 8
    t.integer "q603e_practiced",     limit: 8
    t.integer "q603f",               limit: 8
    t.integer "q603f_practiced",     limit: 8
    t.integer "q604a",               limit: 8
    t.integer "q604a_practiced",     limit: 8
    t.integer "q604b",               limit: 8
    t.integer "q604b_practiced",     limit: 8
    t.integer "q604c",               limit: 8
    t.integer "q604c_practiced",     limit: 8
    t.integer "q604d",               limit: 8
    t.integer "q604d_practiced",     limit: 8
    t.integer "q605a",               limit: 8
    t.integer "q605a_practiced",     limit: 8
    t.integer "q605b",               limit: 8
    t.integer "q605b_practiced",     limit: 8
    t.integer "q606a",               limit: 8
    t.integer "q606a_practiced",     limit: 8
    t.integer "q606b",               limit: 8
    t.integer "q606b_practiced",     limit: 8
    t.integer "q606c",               limit: 8
    t.integer "q606c_practiced",     limit: 8
    t.integer "q606d",               limit: 8
    t.integer "q606d_practiced",     limit: 8
    t.integer "q606e",               limit: 8
    t.integer "q606e_practiced",     limit: 8
    t.integer "q606f",               limit: 8
    t.integer "q606f_practiced",     limit: 8
    t.integer "q606g",               limit: 8
    t.integer "q606g_practiced",     limit: 8
    t.integer "q606h",               limit: 8
    t.integer "q606h_practiced",     limit: 8
    t.integer "q606i",               limit: 8
    t.integer "q606i_practiced",     limit: 8
    t.string  "q701",                limit: nil
    t.integer "p4_resident_id"
  end

  create_table "y3_residency_programs", id: false, force: true do |t|
    t.string  "p4_program_id",        limit: nil, null: false
    t.integer "id",                   limit: 8,   null: false
    t.integer "participant_id",       limit: 8
    t.string  "created_at",           limit: nil
    t.string  "updated_at",           limit: nil
    t.integer "resleave",             limit: 8
    t.integer "resleavepgy1",         limit: 8
    t.integer "resleavepgy2",         limit: 8
    t.integer "resleavepgy3",         limit: 8
    t.integer "resleavepgy4",         limit: 8
    t.integer "facleave",             limit: 8
    t.integer "progdir_leave",        limit: 8
    t.text    "progdir"
    t.integer "siteeval_leave",       limit: 8
    t.text    "siteeval"
    t.integer "assocprogdir_leave",   limit: 8
    t.text    "assocprogdir"
    t.integer "rescoord_leave",       limit: 8
    t.text    "rescoord"
    t.integer "otherfacleave1_leave", limit: 8
    t.text    "otherfacleave1"
    t.text    "otherfacleave1txt"
    t.integer "otherfacleave2_leave", limit: 8
    t.text    "otherfacleave2"
    t.text    "otherfacleave2txt"
    t.integer "numqipgy1res",         limit: 8
    t.integer "numqipgy2res",         limit: 8
    t.integer "numqipgy3res",         limit: 8
    t.integer "numqipgy4res",         limit: 8
    t.integer "numrschpgy1res",       limit: 8
    t.integer "numrschpgy2res",       limit: 8
    t.integer "numrschpgy3res",       limit: 8
    t.integer "numrschpgy4res",       limit: 8
    t.integer "nopgy4",               limit: 8
    t.decimal "pctpeerreview"
    t.decimal "pctnonpeerreview"
    t.decimal "pctpresenting"
    t.integer "rps",                  limit: 8
    t.integer "ratefacdevel",         limit: 8
    t.integer "ratefacmorale",        limit: 8
    t.integer "rateresmorale",        limit: 8
    t.integer "ratesatisfaction",     limit: 8
  end

  create_table "y3_resident_responses", force: true do |t|
    t.string  "p4residency_abfm_id",      limit: nil, null: false
    t.string  "p4_program_id",            limit: nil
    t.integer "abfm_last_four",           limit: 8
    t.string  "p4resid",                  limit: nil
    t.string  "abfm_resident_responses",  limit: nil
    t.string  "contclin",                 limit: nil
    t.integer "age",                      limit: 8
    t.integer "gender",                   limit: 8
    t.integer "race_c",                   limit: 8
    t.integer "race_aa",                  limit: 8
    t.integer "race_ap",                  limit: 8
    t.integer "race_in",                  limit: 8
    t.integer "race_o",                   limit: 8
    t.string  "raceothertxt",             limit: nil
    t.integer "ethnicity",                limit: 8
    t.integer "marital",                  limit: 8
    t.integer "children",                 limit: 8
    t.integer "many",                     limit: 8
    t.integer "medicalafterbs",           limit: 8
    t.decimal "yearsbeforemedschool"
    t.string  "describebeforemed",        limit: nil
    t.integer "usamedschool",             limit: 8
    t.integer "firstgenerationcollege",   limit: 8
    t.integer "firstgenphysician",        limit: 8
    t.integer "firstfamilyphysician",     limit: 8
    t.string  "medgraddate",              limit: nil
    t.integer "programyear",              limit: 8
    t.string  "otherprogramyear",         limit: nil
    t.integer "influence",                limit: 8
    t.integer "masters",                  limit: 8
    t.string  "mastersdegree",            limit: nil
    t.string  "mastersdegreeother",       limit: nil
    t.integer "goals",                    limit: 8
    t.integer "facultyteaching",          limit: 8
    t.integer "facultysupervising",       limit: 8
    t.integer "participationjournalclub", limit: 8
    t.integer "participationconferences", limit: 8
    t.integer "feedback",                 limit: 8
    t.integer "evaluatefaculty",          limit: 8
    t.integer "evaluateprogram",          limit: 8
    t.integer "speakfreely",              limit: 8
    t.integer "othertraineesinterfere",   limit: 8
    t.integer "satisfied",                limit: 8
    t.integer "strengthsfacteaching",     limit: 8
    t.integer "strengthsoverallcurr",     limit: 8
    t.integer "strengthscurrchange",      limit: 8
    t.integer "strengthspracchange",      limit: 8
    t.integer "strengthscompetence",      limit: 8
    t.integer "strengthsp4innovations",   limit: 8
    t.integer "strengthsp4implement",     limit: 8
    t.integer "importance1",              limit: 8
    t.integer "importance2",              limit: 8
    t.integer "importance3",              limit: 8
    t.integer "importance4",              limit: 8
    t.integer "importance5",              limit: 8
    t.integer "importance6",              limit: 8
    t.integer "importance7",              limit: 8
    t.integer "importance8",              limit: 8
    t.integer "importance9",              limit: 8
    t.integer "importance10",             limit: 8
    t.integer "importance11",             limit: 8
    t.integer "importance12",             limit: 8
    t.integer "importance13",             limit: 8
    t.integer "importance14",             limit: 8
    t.integer "importance15",             limit: 8
    t.integer "importance16",             limit: 8
    t.integer "importance17",             limit: 8
    t.integer "importance18",             limit: 8
    t.integer "importance19",             limit: 8
    t.integer "importance20",             limit: 8
    t.integer "importance21",             limit: 8
    t.integer "importance22",             limit: 8
    t.integer "importance23",             limit: 8
    t.integer "importance24",             limit: 8
    t.integer "importance25",             limit: 8
    t.integer "importance26",             limit: 8
    t.integer "importance27",             limit: 8
    t.integer "p4_resident_id"
  end

  create_table "y4_continuity_clinics", id: false, force: true do |t|
    t.string  "p4_program_id",             limit: nil, null: false
    t.string  "settingid",                 limit: nil, null: false
    t.integer "pgy1",                      limit: 8
    t.integer "pgy2",                      limit: 8
    t.integer "pgy3",                      limit: 8
    t.integer "pgy4",                      limit: 8
    t.integer "nopgy4",                    limit: 8
    t.integer "ptassigned",                limit: 8
    t.decimal "pgy1routine"
    t.decimal "pgy2routine"
    t.decimal "pgy3routine"
    t.decimal "pgy4routine"
    t.decimal "pgy1acute"
    t.decimal "pgy2acute"
    t.decimal "pgy3acute"
    t.decimal "pgy4acute"
    t.decimal "daysnewapptfac3"
    t.integer "daysnewapptfac3_unknown",   limit: 8
    t.decimal "daysnewapptres3"
    t.integer "daysnewapptres3_unknown",   limit: 8
    t.decimal "daysfuapptfac3"
    t.integer "daysfuapptfac3_unknown",    limit: 8
    t.decimal "daysfuapptres3"
    t.integer "daysfuapptres3_unknown",    limit: 8
    t.decimal "daysacuteapptfac3"
    t.integer "daysacuteapptfac3_unknown", limit: 8
    t.decimal "daysacuteapptres3"
    t.integer "daysacuteapptres3_unknown", limit: 8
    t.integer "numexamrooms",              limit: 8
    t.integer "numptfac",                  limit: 8
    t.integer "numptmid",                  limit: 8
    t.integer "numptres",                  limit: 8
    t.decimal "ftefp"
    t.decimal "ftefmres"
    t.decimal "fteped"
    t.decimal "ftepedres"
    t.decimal "fteim"
    t.decimal "fteimres"
    t.decimal "fteob"
    t.decimal "fteobres"
    t.integer "fteotherphys1_present",     limit: 8
    t.decimal "fteotherphys1"
    t.text    "fteotherphys1txt"
    t.integer "fteotherphys2_present",     limit: 8
    t.decimal "fteotherphys2"
    t.text    "fteotherphys2txt"
    t.decimal "ftenp"
    t.decimal "ftepa"
    t.decimal "fternlpn"
    t.decimal "ftema"
    t.decimal "fteallied"
    t.decimal "fteadmin"
    t.decimal "ftepsych"
    t.decimal "ftesocial"
    t.decimal "ftediet"
    t.decimal "ftepteduc"
    t.decimal "ftepharm"
    t.integer "fteotherspec1_present",     limit: 8
    t.decimal "fteotherspec1"
    t.text    "fteotherspec1txt"
    t.integer "fteotherspec2_present",     limit: 8
    t.decimal "fteotherspec2"
    t.text    "fteotherspec2txt"
    t.integer "numnp",                     limit: 8
    t.integer "numpa",                     limit: 8
    t.integer "numrnlpn",                  limit: 8
    t.integer "numma",                     limit: 8
    t.integer "numallied",                 limit: 8
    t.integer "numpsych",                  limit: 8
    t.integer "numsocial",                 limit: 8
    t.integer "numdiet",                   limit: 8
    t.integer "numpteduc",                 limit: 8
    t.decimal "numotherspec_present"
    t.integer "numotherspec",              limit: 8
    t.text    "numotherspectxt"
    t.decimal "numotherspec2_present"
    t.integer "numotherspec2",             limit: 8
    t.text    "numotherspec2txt"
    t.integer "integrated",                limit: 8
    t.integer "owner",                     limit: 8
    t.text    "ownerother"
    t.decimal "male"
    t.decimal "female"
    t.text    "gendersource"
    t.decimal "lt3"
    t.decimal "three"
    t.decimal "eighteen"
    t.decimal "twentyfive"
    t.decimal "fortyfive"
    t.decimal "sixtyfive"
    t.decimal "seventyfive"
    t.text    "agesource"
    t.decimal "hispanic"
    t.decimal "nonhispanic"
    t.text    "ethnicitysource"
    t.decimal "indian"
    t.decimal "asian"
    t.decimal "black"
    t.decimal "hawaiian"
    t.decimal "white"
    t.integer "otherrace_present",         limit: 8
    t.decimal "otherrace"
    t.text    "otherracetxt"
    t.text    "racesource"
    t.decimal "prepaid"
    t.decimal "ffs"
    t.decimal "medicare"
    t.decimal "medicaid"
    t.integer "otherpay_present",          limit: 8
    t.decimal "otherpay"
    t.text    "otherpaytxt"
    t.decimal "uninsured"
    t.text    "paysource"
    t.integer "xrays",                     limit: 8
    t.integer "statemr",                   limit: 8
    t.integer "statpaperless",             limit: 8
    t.integer "statremote",                limit: 8
    t.integer "stattranscription",         limit: 8
    t.integer "statscheduling",            limit: 8
    t.integer "statbilling",               limit: 8
    t.integer "statorders",                limit: 8
    t.integer "stathospemr",               limit: 8
    t.integer "statptcommunication",       limit: 8
    t.integer "statprovcommunication",     limit: 8
    t.integer "statqa",                    limit: 8
    t.integer "statdisregistry",           limit: 8
    t.integer "statprevregistry",          limit: 8
    t.integer "statresearch",              limit: 8
    t.integer "statopenaccess",            limit: 8
    t.integer "statexpandedhrs",           limit: 8
    t.integer "stattelephone",             limit: 8
    t.integer "statnetscheduling",         limit: 8
    t.integer "statsurvey",                limit: 8
    t.integer "statspace",                 limit: 8
    t.integer "statparking",               limit: 8
    t.integer "stattransit",               limit: 8
    t.integer "statteams",                 limit: 8
    t.integer "statpsych",                 limit: 8
    t.integer "statcasemgt",               limit: 8
    t.integer "statpharm",                 limit: 8
    t.integer "statgroup",                 limit: 8
    t.integer "statptcentered",            limit: 8
    t.integer "emrimplemented",            limit: 8
    t.decimal "emryears"
    t.text    "emrexplain"
    t.integer "emrptsafety",               limit: 8
    t.text    "emrptsafetytxt"
    t.integer "emr_demographic",           limit: 8
    t.integer "emr_ht_wt",                 limit: 8
    t.integer "emr_dxlist",                limit: 8
    t.integer "emr_active_meds",           limit: 8
    t.integer "emr_allergies",             limit: 8
    t.integer "emr_smoking",               limit: 8
    t.integer "emr_electronic_copy",       limit: 8
    t.integer "emr_electronic_rx",         limit: 8
    t.integer "emr_rx_cpoe",               limit: 8
    t.integer "emr_interaction_check",     limit: 8
    t.integer "emr_electronic_exchange",   limit: 8
    t.integer "emr_ds_compliance",         limit: 8
    t.integer "emr_privacy_security",      limit: 8
    t.integer "emr_aggregate_cqm",         limit: 8
    t.integer "emr_formulary_check",       limit: 8
    t.integer "emr_labs_numerical",        limit: 8
    t.integer "emr_ptlist_by_condition",   limit: 8
    t.integer "emr_pt_education",          limit: 8
    t.integer "emr_med_reconciliation",    limit: 8
    t.integer "emr_summary_of_care",       limit: 8
    t.integer "emr_immunization",          limit: 8
    t.integer "emr_syndromic_surveil",     limit: 8
    t.integer "emr_advance_dir",           limit: 8
    t.integer "emr_reportable_labs",       limit: 8
    t.integer "emr_appt_reminders",        limit: 8
    t.integer "emr_pt_electronic",         limit: 8
    t.string  "pcmhapplied",               limit: nil
    t.string  "pcmhstatus",                limit: nil
    t.string  "pcmhsubmitdate",            limit: nil
    t.string  "pcmhactiondate",            limit: nil
    t.string  "pcmhobtaindate",            limit: nil
  end

  add_index "y4_continuity_clinics", ["settingid"], name: "y4_continuity_clinics_settingid_key", unique: true, using: :btree

  create_table "y4_graduate_responses", force: true do |t|
    t.integer "graduateid",          limit: 8
    t.string  "p4_program_id",       limit: nil
    t.integer "grad_year",           limit: 8
    t.integer "abfm_last_four",      limit: 8
    t.integer "paper",               limit: 8
    t.integer "finished",            limit: 8
    t.integer "max_slide",           limit: 8
    t.string  "created_at",          limit: nil
    t.string  "updated_at",          limit: nil
    t.integer "q101a",               limit: 8
    t.integer "q101b",               limit: 8
    t.integer "q101c",               limit: 8
    t.integer "q101d",               limit: 8
    t.integer "q102a",               limit: 8
    t.integer "q102b",               limit: 8
    t.integer "q102c",               limit: 8
    t.integer "q102d",               limit: 8
    t.string  "q102d_other",         limit: nil
    t.integer "q103a",               limit: 8
    t.integer "q103b_1",             limit: 8
    t.integer "q103b_2",             limit: 8
    t.integer "q103b_3",             limit: 8
    t.integer "q103b_4",             limit: 8
    t.integer "q103b_5",             limit: 8
    t.integer "q103b_6",             limit: 8
    t.integer "q103b_7",             limit: 8
    t.integer "q103b_8",             limit: 8
    t.integer "q103b_9",             limit: 8
    t.integer "q103b_10",            limit: 8
    t.string  "q103b_other",         limit: nil
    t.string  "q104",                limit: nil
    t.decimal "q105"
    t.integer "q106",                limit: 8
    t.integer "q107_1",              limit: 8
    t.integer "q107_2",              limit: 8
    t.integer "q107_3",              limit: 8
    t.integer "q107_4",              limit: 8
    t.integer "q107_5",              limit: 8
    t.integer "q107_6",              limit: 8
    t.integer "q107_7",              limit: 8
    t.string  "q107_other",          limit: nil
    t.integer "q108",                limit: 8
    t.integer "q201",                limit: 8
    t.string  "q201_other",          limit: nil
    t.integer "q202_a",              limit: 8
    t.integer "q202_b",              limit: 8
    t.integer "q202_c",              limit: 8
    t.integer "q202_d",              limit: 8
    t.integer "q202_e",              limit: 8
    t.integer "q202_f",              limit: 8
    t.integer "q202_g",              limit: 8
    t.integer "q202_h",              limit: 8
    t.string  "q202_other",          limit: nil
    t.integer "q202_none",           limit: 8
    t.integer "q203",                limit: 8
    t.decimal "q204"
    t.integer "q205",                limit: 8
    t.decimal "q206"
    t.decimal "q207a"
    t.decimal "q207b"
    t.decimal "q207c"
    t.decimal "q207d"
    t.decimal "q207e"
    t.decimal "q207f"
    t.integer "q207f_other_present", limit: 8
    t.string  "q207f_other",         limit: nil
    t.integer "q208",                limit: 8
    t.integer "q301a",               limit: 8
    t.integer "q301b",               limit: 8
    t.integer "q301c",               limit: 8
    t.integer "q301d",               limit: 8
    t.integer "q401",                limit: 8
    t.integer "q402",                limit: 8
    t.integer "q403",                limit: 8
    t.integer "q404",                limit: 8
    t.integer "q405",                limit: 8
    t.integer "q406",                limit: 8
    t.integer "q407",                limit: 8
    t.integer "q408",                limit: 8
    t.integer "q409",                limit: 8
    t.integer "q410",                limit: 8
    t.integer "q411",                limit: 8
    t.integer "q412",                limit: 8
    t.integer "q413",                limit: 8
    t.integer "q414",                limit: 8
    t.integer "q415",                limit: 8
    t.integer "q416",                limit: 8
    t.integer "q417",                limit: 8
    t.integer "q418",                limit: 8
    t.integer "q419",                limit: 8
    t.integer "q420",                limit: 8
    t.integer "q421",                limit: 8
    t.integer "q422",                limit: 8
    t.integer "q423",                limit: 8
    t.integer "q424",                limit: 8
    t.integer "q425",                limit: 8
    t.integer "q426",                limit: 8
    t.integer "q427",                limit: 8
    t.integer "q428",                limit: 8
    t.integer "q429",                limit: 8
    t.integer "q430",                limit: 8
    t.integer "q501a",               limit: 8
    t.integer "q501b",               limit: 8
    t.integer "q501c",               limit: 8
    t.integer "q501d",               limit: 8
    t.integer "q501e",               limit: 8
    t.integer "q501f",               limit: 8
    t.integer "q501g",               limit: 8
    t.integer "q502",                limit: 8
    t.integer "q503",                limit: 8
    t.integer "q503_group",          limit: 8
    t.integer "q503a",               limit: 8
    t.integer "q503b",               limit: 8
    t.integer "q504",                limit: 8
    t.string  "q504_describe",       limit: nil
    t.integer "q505_1",              limit: 8
    t.integer "q505_2",              limit: 8
    t.integer "q505_3",              limit: 8
    t.integer "q505_4",              limit: 8
    t.string  "q505_other",          limit: nil
    t.integer "q505_none",           limit: 8
    t.integer "q506a",               limit: 8
    t.integer "q506a_practiced",     limit: 8
    t.integer "q506b",               limit: 8
    t.integer "q506b_practiced",     limit: 8
    t.integer "q506c",               limit: 8
    t.integer "q506c_practiced",     limit: 8
    t.integer "q506d",               limit: 8
    t.integer "q506d_practiced",     limit: 8
    t.integer "q506e",               limit: 8
    t.integer "q506e_practiced",     limit: 8
    t.integer "q507a",               limit: 8
    t.integer "q507a_practiced",     limit: 8
    t.integer "q507b",               limit: 8
    t.integer "q507b_practiced",     limit: 8
    t.integer "q507c",               limit: 8
    t.integer "q507c_practiced",     limit: 8
    t.integer "q507d",               limit: 8
    t.integer "q507d_practiced",     limit: 8
    t.integer "q507e",               limit: 8
    t.integer "q507e_practiced",     limit: 8
    t.integer "q507f",               limit: 8
    t.integer "q507f_practiced",     limit: 8
    t.integer "q507g",               limit: 8
    t.integer "q507g_practiced",     limit: 8
    t.integer "q507h",               limit: 8
    t.integer "q507h_practiced",     limit: 8
    t.integer "q507i",               limit: 8
    t.integer "q507i_practiced",     limit: 8
    t.integer "q507j",               limit: 8
    t.integer "q507j_practiced",     limit: 8
    t.integer "q508a",               limit: 8
    t.integer "q508a_practiced",     limit: 8
    t.integer "q508b",               limit: 8
    t.integer "q508b_practiced",     limit: 8
    t.integer "q508c",               limit: 8
    t.integer "q508c_practiced",     limit: 8
    t.integer "q508d",               limit: 8
    t.integer "q508d_practiced",     limit: 8
    t.integer "q508e",               limit: 8
    t.integer "q508e_practiced",     limit: 8
    t.integer "q508f",               limit: 8
    t.integer "q508f_practiced",     limit: 8
    t.integer "q508g",               limit: 8
    t.integer "q508g_practiced",     limit: 8
    t.integer "q509a",               limit: 8
    t.integer "q509a_practiced",     limit: 8
    t.integer "q509b",               limit: 8
    t.integer "q509b_practiced",     limit: 8
    t.integer "q509c",               limit: 8
    t.integer "q509c_practiced",     limit: 8
    t.integer "q510a",               limit: 8
    t.integer "q510a_practiced",     limit: 8
    t.integer "q510b",               limit: 8
    t.integer "q510b_practiced",     limit: 8
    t.integer "q510c",               limit: 8
    t.integer "q510c_practiced",     limit: 8
    t.integer "q510d",               limit: 8
    t.integer "q510d_practiced",     limit: 8
    t.integer "q510e",               limit: 8
    t.integer "q510e_practiced",     limit: 8
    t.integer "q510f",               limit: 8
    t.integer "q510f_practiced",     limit: 8
    t.integer "q510g",               limit: 8
    t.integer "q510g_practiced",     limit: 8
    t.integer "q510h",               limit: 8
    t.integer "q510h_practiced",     limit: 8
    t.integer "q511a",               limit: 8
    t.integer "q511a_practiced",     limit: 8
    t.integer "q511b",               limit: 8
    t.integer "q511b_practiced",     limit: 8
    t.integer "q511c",               limit: 8
    t.integer "q511c_practiced",     limit: 8
    t.integer "q512a",               limit: 8
    t.integer "q512a_practiced",     limit: 8
    t.integer "q512b",               limit: 8
    t.integer "q512b_practiced",     limit: 8
    t.integer "q513a",               limit: 8
    t.integer "q513a_practiced",     limit: 8
    t.integer "q513b",               limit: 8
    t.integer "q513b_practiced",     limit: 8
    t.integer "q513c",               limit: 8
    t.integer "q513c_practiced",     limit: 8
    t.integer "q513d",               limit: 8
    t.integer "q513d_practiced",     limit: 8
    t.integer "q513e",               limit: 8
    t.integer "q513e_practiced",     limit: 8
    t.integer "q514a",               limit: 8
    t.integer "q514a_practiced",     limit: 8
    t.integer "q514b",               limit: 8
    t.integer "q514b_practiced",     limit: 8
    t.integer "q514c",               limit: 8
    t.integer "q514c_practiced",     limit: 8
    t.integer "q514d",               limit: 8
    t.integer "q514d_practiced",     limit: 8
    t.integer "q514e",               limit: 8
    t.integer "q514e_practiced",     limit: 8
    t.integer "q514f",               limit: 8
    t.integer "q514f_practiced",     limit: 8
    t.integer "q514g",               limit: 8
    t.integer "q514g_practiced",     limit: 8
    t.integer "q514h",               limit: 8
    t.integer "q514h_practiced",     limit: 8
    t.integer "q514i",               limit: 8
    t.integer "q514i_practiced",     limit: 8
    t.integer "q514j",               limit: 8
    t.integer "q514j_practiced",     limit: 8
    t.integer "q601a",               limit: 8
    t.integer "q601a_practiced",     limit: 8
    t.integer "q601b",               limit: 8
    t.integer "q601b_practiced",     limit: 8
    t.integer "q601c",               limit: 8
    t.integer "q601c_practiced",     limit: 8
    t.integer "q601d",               limit: 8
    t.integer "q601d_practiced",     limit: 8
    t.integer "q601e",               limit: 8
    t.integer "q601e_practiced",     limit: 8
    t.integer "q602a",               limit: 8
    t.integer "q602a_practiced",     limit: 8
    t.integer "q602b",               limit: 8
    t.integer "q602b_practiced",     limit: 8
    t.integer "q602c",               limit: 8
    t.integer "q602c_practiced",     limit: 8
    t.integer "q602d",               limit: 8
    t.integer "q602d_practiced",     limit: 8
    t.integer "q602e",               limit: 8
    t.integer "q602e_practiced",     limit: 8
    t.integer "q603a",               limit: 8
    t.integer "q603a_practiced",     limit: 8
    t.integer "q603b",               limit: 8
    t.integer "q603b_practiced",     limit: 8
    t.integer "q603c",               limit: 8
    t.integer "q603c_practiced",     limit: 8
    t.integer "q603d",               limit: 8
    t.integer "q603d_practiced",     limit: 8
    t.integer "q603e",               limit: 8
    t.integer "q603e_practiced",     limit: 8
    t.integer "q603f",               limit: 8
    t.integer "q603f_practiced",     limit: 8
    t.integer "q604a",               limit: 8
    t.integer "q604a_practiced",     limit: 8
    t.integer "q604b",               limit: 8
    t.integer "q604b_practiced",     limit: 8
    t.integer "q604c",               limit: 8
    t.integer "q604c_practiced",     limit: 8
    t.integer "q604d",               limit: 8
    t.integer "q604d_practiced",     limit: 8
    t.integer "q605a",               limit: 8
    t.integer "q605a_practiced",     limit: 8
    t.integer "q605b",               limit: 8
    t.integer "q605b_practiced",     limit: 8
    t.integer "q606a",               limit: 8
    t.integer "q606a_practiced",     limit: 8
    t.integer "q606b",               limit: 8
    t.integer "q606b_practiced",     limit: 8
    t.integer "q606c",               limit: 8
    t.integer "q606c_practiced",     limit: 8
    t.integer "q606d",               limit: 8
    t.integer "q606d_practiced",     limit: 8
    t.integer "q606e",               limit: 8
    t.integer "q606e_practiced",     limit: 8
    t.integer "q606f",               limit: 8
    t.integer "q606f_practiced",     limit: 8
    t.integer "q606g",               limit: 8
    t.integer "q606g_practiced",     limit: 8
    t.integer "q606h",               limit: 8
    t.integer "q606h_practiced",     limit: 8
    t.integer "q606i",               limit: 8
    t.integer "q606i_practiced",     limit: 8
    t.string  "q701",                limit: nil
    t.integer "p4_resident_id"
  end

  create_table "y4_residency_programs", id: false, force: true do |t|
    t.string  "p4_program_id",        limit: nil, null: false
    t.integer "resleave",             limit: 8
    t.integer "resleavepgy1",         limit: 8
    t.integer "resleavepgy2",         limit: 8
    t.integer "resleavepgy3",         limit: 8
    t.integer "resleavepgy4",         limit: 8
    t.integer "facleave",             limit: 8
    t.integer "progdir_leave",        limit: 8
    t.text    "progdir"
    t.integer "siteeval_leave",       limit: 8
    t.text    "siteeval"
    t.integer "assocprogdir_leave",   limit: 8
    t.text    "assocprogdir"
    t.integer "rescoord_leave",       limit: 8
    t.text    "rescoord"
    t.integer "otherfacleave1_leave", limit: 8
    t.text    "otherfacleave1"
    t.text    "otherfacleave1txt"
    t.integer "otherfacleave2_leave", limit: 8
    t.text    "otherfacleave2"
    t.text    "otherfacleave2txt"
    t.integer "numqipgy1res",         limit: 8
    t.integer "numqipgy2res",         limit: 8
    t.integer "numqipgy3res",         limit: 8
    t.integer "numqipgy4res",         limit: 8
    t.integer "numrschpgy1res",       limit: 8
    t.integer "numrschpgy2res",       limit: 8
    t.integer "numrschpgy3res",       limit: 8
    t.integer "numrschpgy4res",       limit: 8
    t.integer "nopgy4",               limit: 8
    t.decimal "pctpeerreview"
    t.decimal "pctnonpeerreview"
    t.decimal "pctpresenting"
    t.integer "rps",                  limit: 8
    t.integer "ratefacdevel",         limit: 8
    t.integer "ratefacmorale",        limit: 8
    t.integer "rateresmorale",        limit: 8
    t.integer "ratesatisfaction",     limit: 8
  end

  create_table "y4_resident_responses", force: true do |t|
    t.string  "p4residency_abfm_id",      limit: nil, null: false
    t.string  "contclin",                 limit: nil
    t.string  "p4_program_id",            limit: nil
    t.integer "abfm_last_four",           limit: 8
    t.integer "age",                      limit: 8
    t.integer "gender",                   limit: 8
    t.integer "race_c",                   limit: 8
    t.integer "race_aa",                  limit: 8
    t.integer "race_ap",                  limit: 8
    t.integer "race_in",                  limit: 8
    t.integer "race_o",                   limit: 8
    t.string  "raceothertxt",             limit: nil
    t.integer "ethnicity",                limit: 8
    t.integer "marital",                  limit: 8
    t.integer "children",                 limit: 8
    t.integer "many",                     limit: 8
    t.integer "medicalafterbs",           limit: 8
    t.decimal "yearsbeforemedschool"
    t.string  "describebeforemed",        limit: nil
    t.integer "usamedschool",             limit: 8
    t.integer "firstgenerationcollege",   limit: 8
    t.integer "firstgenphysician",        limit: 8
    t.integer "firstfamilyphysician",     limit: 8
    t.string  "medgraddate",              limit: nil
    t.integer "programyear",              limit: 8
    t.string  "otherprogramyear",         limit: nil
    t.integer "influence",                limit: 8
    t.integer "masters",                  limit: 8
    t.string  "mastersdegree",            limit: nil
    t.string  "mastersdegreeother",       limit: nil
    t.integer "goals",                    limit: 8
    t.integer "facultyteaching",          limit: 8
    t.integer "facultysupervising",       limit: 8
    t.integer "participationjournalclub", limit: 8
    t.integer "participationconferences", limit: 8
    t.integer "feedback",                 limit: 8
    t.integer "evaluatefaculty",          limit: 8
    t.integer "evaluateprogram",          limit: 8
    t.integer "speakfreely",              limit: 8
    t.integer "othertraineesinterfere",   limit: 8
    t.integer "satisfied",                limit: 8
    t.integer "strengthsfacteaching",     limit: 8
    t.integer "strengthsoverallcurr",     limit: 8
    t.integer "strengthscurrchange",      limit: 8
    t.integer "strengthspracchange",      limit: 8
    t.integer "strengthscompetence",      limit: 8
    t.integer "strengthsp4innovations",   limit: 8
    t.integer "strengthsp4implement",     limit: 8
    t.integer "importance1",              limit: 8
    t.integer "importance2",              limit: 8
    t.integer "importance3",              limit: 8
    t.integer "importance4",              limit: 8
    t.integer "importance5",              limit: 8
    t.integer "importance6",              limit: 8
    t.integer "importance7",              limit: 8
    t.integer "importance8",              limit: 8
    t.integer "importance9",              limit: 8
    t.integer "importance10",             limit: 8
    t.integer "importance11",             limit: 8
    t.integer "importance12",             limit: 8
    t.integer "importance13",             limit: 8
    t.integer "importance14",             limit: 8
    t.integer "importance15",             limit: 8
    t.integer "importance16",             limit: 8
    t.integer "importance17",             limit: 8
    t.integer "importance18",             limit: 8
    t.integer "importance19",             limit: 8
    t.integer "importance20",             limit: 8
    t.integer "importance21",             limit: 8
    t.integer "importance22",             limit: 8
    t.integer "importance23",             limit: 8
    t.integer "importance24",             limit: 8
    t.integer "importance25",             limit: 8
    t.integer "importance26",             limit: 8
    t.integer "importance27",             limit: 8
    t.integer "p4_resident_id"
  end

  create_table "y5_continuity_clinics", id: false, force: true do |t|
    t.string  "p4_program_id",             limit: nil, null: false
    t.string  "settingid",                 limit: nil, null: false
    t.integer "pgy1",                      limit: 8
    t.integer "pgy2",                      limit: 8
    t.integer "pgy3",                      limit: 8
    t.integer "pgy4",                      limit: 8
    t.integer "nopgy4",                    limit: 8
    t.integer "ptassigned",                limit: 8
    t.decimal "pgy1routine"
    t.decimal "pgy2routine"
    t.decimal "pgy3routine"
    t.decimal "pgy4routine"
    t.decimal "pgy1acute"
    t.decimal "pgy2acute"
    t.decimal "pgy3acute"
    t.decimal "pgy4acute"
    t.decimal "daysnewapptfac3"
    t.integer "daysnewapptfac3_unknown",   limit: 8
    t.decimal "daysnewapptres3"
    t.integer "daysnewapptres3_unknown",   limit: 8
    t.decimal "daysfuapptfac3"
    t.integer "daysfuapptfac3_unknown",    limit: 8
    t.decimal "daysfuapptres3"
    t.integer "daysfuapptres3_unknown",    limit: 8
    t.decimal "daysacuteapptfac3"
    t.integer "daysacuteapptfac3_unknown", limit: 8
    t.decimal "daysacuteapptres3"
    t.integer "daysacuteapptres3_unknown", limit: 8
    t.integer "numexamrooms",              limit: 8
    t.integer "numptfac",                  limit: 8
    t.integer "numptmid",                  limit: 8
    t.integer "numptres",                  limit: 8
    t.decimal "ftefp"
    t.decimal "ftefmres"
    t.decimal "fteped"
    t.decimal "ftepedres"
    t.decimal "fteim"
    t.decimal "fteimres"
    t.decimal "fteob"
    t.decimal "fteobres"
    t.integer "fteotherphys1_present",     limit: 8
    t.decimal "fteotherphys1"
    t.text    "fteotherphys1txt"
    t.integer "fteotherphys2_present",     limit: 8
    t.decimal "fteotherphys2"
    t.text    "fteotherphys2txt"
    t.decimal "ftenp"
    t.decimal "ftepa"
    t.decimal "fternlpn"
    t.decimal "ftema"
    t.decimal "fteallied"
    t.decimal "fteadmin"
    t.decimal "ftepsych"
    t.decimal "ftesocial"
    t.decimal "ftediet"
    t.decimal "ftepteduc"
    t.decimal "ftepharm"
    t.integer "fteotherspec1_present",     limit: 8
    t.decimal "fteotherspec1"
    t.text    "fteotherspec1txt"
    t.integer "fteotherspec2_present",     limit: 8
    t.decimal "fteotherspec2"
    t.text    "fteotherspec2txt"
    t.integer "numnp",                     limit: 8
    t.integer "numpa",                     limit: 8
    t.integer "numrnlpn",                  limit: 8
    t.integer "numma",                     limit: 8
    t.integer "numallied",                 limit: 8
    t.integer "numpsych",                  limit: 8
    t.integer "numsocial",                 limit: 8
    t.integer "numdiet",                   limit: 8
    t.integer "numpteduc",                 limit: 8
    t.decimal "numotherspec_present"
    t.integer "numotherspec",              limit: 8
    t.text    "numotherspectxt"
    t.decimal "numotherspec2_present"
    t.integer "numotherspec2",             limit: 8
    t.text    "numotherspec2txt"
    t.integer "integrated",                limit: 8
    t.integer "owner",                     limit: 8
    t.text    "ownerother"
    t.decimal "male"
    t.decimal "female"
    t.text    "gendersource"
    t.decimal "lt3"
    t.decimal "three"
    t.decimal "eighteen"
    t.decimal "twentyfive"
    t.decimal "fortyfive"
    t.decimal "sixtyfive"
    t.decimal "seventyfive"
    t.text    "agesource"
    t.decimal "hispanic"
    t.decimal "nonhispanic"
    t.text    "ethnicitysource"
    t.decimal "indian"
    t.decimal "asian"
    t.decimal "black"
    t.decimal "hawaiian"
    t.decimal "white"
    t.integer "otherrace_present",         limit: 8
    t.decimal "otherrace"
    t.text    "otherracetxt"
    t.text    "racesource"
    t.decimal "prepaid"
    t.decimal "ffs"
    t.decimal "medicare"
    t.decimal "medicaid"
    t.integer "otherpay_present",          limit: 8
    t.decimal "otherpay"
    t.text    "otherpaytxt"
    t.decimal "uninsured"
    t.text    "paysource"
    t.integer "xrays",                     limit: 8
    t.integer "statemr",                   limit: 8
    t.integer "statpaperless",             limit: 8
    t.integer "statremote",                limit: 8
    t.integer "stattranscription",         limit: 8
    t.integer "statscheduling",            limit: 8
    t.integer "statbilling",               limit: 8
    t.integer "statorders",                limit: 8
    t.integer "stathospemr",               limit: 8
    t.integer "statptcommunication",       limit: 8
    t.integer "statprovcommunication",     limit: 8
    t.integer "statqa",                    limit: 8
    t.integer "statdisregistry",           limit: 8
    t.integer "statprevregistry",          limit: 8
    t.integer "statresearch",              limit: 8
    t.integer "statopenaccess",            limit: 8
    t.integer "statexpandedhrs",           limit: 8
    t.integer "stattelephone",             limit: 8
    t.integer "statnetscheduling",         limit: 8
    t.integer "statsurvey",                limit: 8
    t.integer "statspace",                 limit: 8
    t.integer "statparking",               limit: 8
    t.integer "stattransit",               limit: 8
    t.integer "statteams",                 limit: 8
    t.integer "statpsych",                 limit: 8
    t.integer "statcasemgt",               limit: 8
    t.integer "statpharm",                 limit: 8
    t.integer "statgroup",                 limit: 8
    t.integer "statptcentered",            limit: 8
    t.integer "emrimplemented",            limit: 8
    t.decimal "emryears"
    t.text    "emrexplain"
    t.integer "emrptsafety",               limit: 8
    t.text    "emrptsafetytxt"
    t.integer "emr_demographic",           limit: 8
    t.integer "emr_ht_wt",                 limit: 8
    t.integer "emr_dxlist",                limit: 8
    t.integer "emr_active_meds",           limit: 8
    t.integer "emr_allergies",             limit: 8
    t.integer "emr_smoking",               limit: 8
    t.integer "emr_electronic_copy",       limit: 8
    t.integer "emr_electronic_rx",         limit: 8
    t.integer "emr_rx_cpoe",               limit: 8
    t.integer "emr_interaction_check",     limit: 8
    t.integer "emr_electronic_exchange",   limit: 8
    t.integer "emr_ds_compliance",         limit: 8
    t.integer "emr_privacy_security",      limit: 8
    t.integer "emr_aggregate_cqm",         limit: 8
    t.integer "emr_formulary_check",       limit: 8
    t.integer "emr_labs_numerical",        limit: 8
    t.integer "emr_ptlist_by_condition",   limit: 8
    t.integer "emr_pt_education",          limit: 8
    t.integer "emr_med_reconciliation",    limit: 8
    t.integer "emr_summary_of_care",       limit: 8
    t.integer "emr_immunization",          limit: 8
    t.integer "emr_syndromic_surveil",     limit: 8
    t.integer "emr_advance_dir",           limit: 8
    t.integer "emr_reportable_labs",       limit: 8
    t.integer "emr_appt_reminders",        limit: 8
    t.integer "emr_pt_electronic",         limit: 8
    t.string  "pcmhapplied",               limit: nil
    t.string  "pcmhstatus",                limit: nil
    t.string  "pcmhsubmitdate",            limit: nil
    t.string  "pcmhactiondate",            limit: nil
    t.string  "pcmhobtaindate",            limit: nil
  end

  add_index "y5_continuity_clinics", ["settingid"], name: "y5_continuity_clinics_settingid_key", unique: true, using: :btree

  create_table "y5_graduate_responses", force: true do |t|
    t.integer "graduateid",          limit: 8
    t.string  "p4_program_id",       limit: nil
    t.integer "grad_year",           limit: 8
    t.integer "abfm_last_four",      limit: 8
    t.integer "paper",               limit: 8
    t.integer "finished",            limit: 8
    t.integer "max_slide",           limit: 8
    t.string  "created_at",          limit: nil
    t.string  "updated_at",          limit: nil
    t.integer "q101a",               limit: 8
    t.integer "q101b",               limit: 8
    t.integer "q101c",               limit: 8
    t.integer "q101d",               limit: 8
    t.integer "q102a",               limit: 8
    t.integer "q102b",               limit: 8
    t.integer "q102c",               limit: 8
    t.integer "q102d",               limit: 8
    t.string  "q102d_other",         limit: nil
    t.integer "q103a",               limit: 8
    t.integer "q103b_1",             limit: 8
    t.integer "q103b_2",             limit: 8
    t.integer "q103b_3",             limit: 8
    t.integer "q103b_4",             limit: 8
    t.integer "q103b_5",             limit: 8
    t.integer "q103b_6",             limit: 8
    t.integer "q103b_7",             limit: 8
    t.integer "q103b_8",             limit: 8
    t.integer "q103b_9",             limit: 8
    t.integer "q103b_10",            limit: 8
    t.string  "q103b_other",         limit: nil
    t.string  "q104",                limit: nil
    t.decimal "q105"
    t.integer "q106",                limit: 8
    t.integer "q107_1",              limit: 8
    t.integer "q107_2",              limit: 8
    t.integer "q107_3",              limit: 8
    t.integer "q107_4",              limit: 8
    t.integer "q107_5",              limit: 8
    t.integer "q107_6",              limit: 8
    t.integer "q107_7",              limit: 8
    t.string  "q107_other",          limit: nil
    t.integer "q108",                limit: 8
    t.integer "q201",                limit: 8
    t.string  "q201_other",          limit: nil
    t.integer "q202_a",              limit: 8
    t.integer "q202_b",              limit: 8
    t.integer "q202_c",              limit: 8
    t.integer "q202_d",              limit: 8
    t.integer "q202_e",              limit: 8
    t.integer "q202_f",              limit: 8
    t.integer "q202_g",              limit: 8
    t.integer "q202_h",              limit: 8
    t.string  "q202_other",          limit: nil
    t.integer "q202_none",           limit: 8
    t.integer "q203",                limit: 8
    t.decimal "q204"
    t.integer "q205",                limit: 8
    t.decimal "q206"
    t.decimal "q207a"
    t.decimal "q207b"
    t.decimal "q207c"
    t.decimal "q207d"
    t.decimal "q207e"
    t.decimal "q207f"
    t.integer "q207f_other_present", limit: 8
    t.string  "q207f_other",         limit: nil
    t.integer "q208",                limit: 8
    t.integer "q301a",               limit: 8
    t.integer "q301b",               limit: 8
    t.integer "q301c",               limit: 8
    t.integer "q301d",               limit: 8
    t.integer "q401",                limit: 8
    t.integer "q402",                limit: 8
    t.integer "q403",                limit: 8
    t.integer "q404",                limit: 8
    t.integer "q405",                limit: 8
    t.integer "q406",                limit: 8
    t.integer "q407",                limit: 8
    t.integer "q408",                limit: 8
    t.integer "q409",                limit: 8
    t.integer "q410",                limit: 8
    t.integer "q411",                limit: 8
    t.integer "q412",                limit: 8
    t.integer "q413",                limit: 8
    t.integer "q414",                limit: 8
    t.integer "q415",                limit: 8
    t.integer "q416",                limit: 8
    t.integer "q417",                limit: 8
    t.integer "q418",                limit: 8
    t.integer "q419",                limit: 8
    t.integer "q420",                limit: 8
    t.integer "q421",                limit: 8
    t.integer "q422",                limit: 8
    t.integer "q423",                limit: 8
    t.integer "q424",                limit: 8
    t.integer "q425",                limit: 8
    t.integer "q426",                limit: 8
    t.integer "q427",                limit: 8
    t.integer "q428",                limit: 8
    t.integer "q429",                limit: 8
    t.integer "q430",                limit: 8
    t.integer "q501a",               limit: 8
    t.integer "q501b",               limit: 8
    t.integer "q501c",               limit: 8
    t.integer "q501d",               limit: 8
    t.integer "q501e",               limit: 8
    t.integer "q501f",               limit: 8
    t.integer "q501g",               limit: 8
    t.integer "q502",                limit: 8
    t.integer "q503",                limit: 8
    t.integer "q503_group",          limit: 8
    t.integer "q503a",               limit: 8
    t.integer "q503b",               limit: 8
    t.integer "q504",                limit: 8
    t.string  "q504_describe",       limit: nil
    t.integer "q505_1",              limit: 8
    t.integer "q505_2",              limit: 8
    t.integer "q505_3",              limit: 8
    t.integer "q505_4",              limit: 8
    t.string  "q505_other",          limit: nil
    t.integer "q505_none",           limit: 8
    t.integer "q506a",               limit: 8
    t.integer "q506a_practiced",     limit: 8
    t.integer "q506b",               limit: 8
    t.integer "q506b_practiced",     limit: 8
    t.integer "q506c",               limit: 8
    t.integer "q506c_practiced",     limit: 8
    t.integer "q506d",               limit: 8
    t.integer "q506d_practiced",     limit: 8
    t.integer "q506e",               limit: 8
    t.integer "q506e_practiced",     limit: 8
    t.integer "q507a",               limit: 8
    t.integer "q507a_practiced",     limit: 8
    t.integer "q507b",               limit: 8
    t.integer "q507b_practiced",     limit: 8
    t.integer "q507c",               limit: 8
    t.integer "q507c_practiced",     limit: 8
    t.integer "q507d",               limit: 8
    t.integer "q507d_practiced",     limit: 8
    t.integer "q507e",               limit: 8
    t.integer "q507e_practiced",     limit: 8
    t.integer "q507f",               limit: 8
    t.integer "q507f_practiced",     limit: 8
    t.integer "q507g",               limit: 8
    t.integer "q507g_practiced",     limit: 8
    t.integer "q507h",               limit: 8
    t.integer "q507h_practiced",     limit: 8
    t.integer "q507i",               limit: 8
    t.integer "q507i_practiced",     limit: 8
    t.integer "q507j",               limit: 8
    t.integer "q507j_practiced",     limit: 8
    t.integer "q508a",               limit: 8
    t.integer "q508a_practiced",     limit: 8
    t.integer "q508b",               limit: 8
    t.integer "q508b_practiced",     limit: 8
    t.integer "q508c",               limit: 8
    t.integer "q508c_practiced",     limit: 8
    t.integer "q508d",               limit: 8
    t.integer "q508d_practiced",     limit: 8
    t.integer "q508e",               limit: 8
    t.integer "q508e_practiced",     limit: 8
    t.integer "q508f",               limit: 8
    t.integer "q508f_practiced",     limit: 8
    t.integer "q508g",               limit: 8
    t.integer "q508g_practiced",     limit: 8
    t.integer "q509a",               limit: 8
    t.integer "q509a_practiced",     limit: 8
    t.integer "q509b",               limit: 8
    t.integer "q509b_practiced",     limit: 8
    t.integer "q509c",               limit: 8
    t.integer "q509c_practiced",     limit: 8
    t.integer "q510a",               limit: 8
    t.integer "q510a_practiced",     limit: 8
    t.integer "q510b",               limit: 8
    t.integer "q510b_practiced",     limit: 8
    t.integer "q510c",               limit: 8
    t.integer "q510c_practiced",     limit: 8
    t.integer "q510d",               limit: 8
    t.integer "q510d_practiced",     limit: 8
    t.integer "q510e",               limit: 8
    t.integer "q510e_practiced",     limit: 8
    t.integer "q510f",               limit: 8
    t.integer "q510f_practiced",     limit: 8
    t.integer "q510g",               limit: 8
    t.integer "q510g_practiced",     limit: 8
    t.integer "q510h",               limit: 8
    t.integer "q510h_practiced",     limit: 8
    t.integer "q511a",               limit: 8
    t.integer "q511a_practiced",     limit: 8
    t.integer "q511b",               limit: 8
    t.integer "q511b_practiced",     limit: 8
    t.integer "q511c",               limit: 8
    t.integer "q511c_practiced",     limit: 8
    t.integer "q512a",               limit: 8
    t.integer "q512a_practiced",     limit: 8
    t.integer "q512b",               limit: 8
    t.integer "q512b_practiced",     limit: 8
    t.integer "q513a",               limit: 8
    t.integer "q513a_practiced",     limit: 8
    t.integer "q513b",               limit: 8
    t.integer "q513b_practiced",     limit: 8
    t.integer "q513c",               limit: 8
    t.integer "q513c_practiced",     limit: 8
    t.integer "q513d",               limit: 8
    t.integer "q513d_practiced",     limit: 8
    t.integer "q513e",               limit: 8
    t.integer "q513e_practiced",     limit: 8
    t.integer "q514a",               limit: 8
    t.integer "q514a_practiced",     limit: 8
    t.integer "q514b",               limit: 8
    t.integer "q514b_practiced",     limit: 8
    t.integer "q514c",               limit: 8
    t.integer "q514c_practiced",     limit: 8
    t.integer "q514d",               limit: 8
    t.integer "q514d_practiced",     limit: 8
    t.integer "q514e",               limit: 8
    t.integer "q514e_practiced",     limit: 8
    t.integer "q514f",               limit: 8
    t.integer "q514f_practiced",     limit: 8
    t.integer "q514g",               limit: 8
    t.integer "q514g_practiced",     limit: 8
    t.integer "q514h",               limit: 8
    t.integer "q514h_practiced",     limit: 8
    t.integer "q514i",               limit: 8
    t.integer "q514i_practiced",     limit: 8
    t.integer "q514j",               limit: 8
    t.integer "q514j_practiced",     limit: 8
    t.integer "q601a",               limit: 8
    t.integer "q601a_practiced",     limit: 8
    t.integer "q601b",               limit: 8
    t.integer "q601b_practiced",     limit: 8
    t.integer "q601c",               limit: 8
    t.integer "q601c_practiced",     limit: 8
    t.integer "q601d",               limit: 8
    t.integer "q601d_practiced",     limit: 8
    t.integer "q601e",               limit: 8
    t.integer "q601e_practiced",     limit: 8
    t.integer "q602a",               limit: 8
    t.integer "q602a_practiced",     limit: 8
    t.integer "q602b",               limit: 8
    t.integer "q602b_practiced",     limit: 8
    t.integer "q602c",               limit: 8
    t.integer "q602c_practiced",     limit: 8
    t.integer "q602d",               limit: 8
    t.integer "q602d_practiced",     limit: 8
    t.integer "q602e",               limit: 8
    t.integer "q602e_practiced",     limit: 8
    t.integer "q603a",               limit: 8
    t.integer "q603a_practiced",     limit: 8
    t.integer "q603b",               limit: 8
    t.integer "q603b_practiced",     limit: 8
    t.integer "q603c",               limit: 8
    t.integer "q603c_practiced",     limit: 8
    t.integer "q603d",               limit: 8
    t.integer "q603d_practiced",     limit: 8
    t.integer "q603e",               limit: 8
    t.integer "q603e_practiced",     limit: 8
    t.integer "q603f",               limit: 8
    t.integer "q603f_practiced",     limit: 8
    t.integer "q604a",               limit: 8
    t.integer "q604a_practiced",     limit: 8
    t.integer "q604b",               limit: 8
    t.integer "q604b_practiced",     limit: 8
    t.integer "q604c",               limit: 8
    t.integer "q604c_practiced",     limit: 8
    t.integer "q604d",               limit: 8
    t.integer "q604d_practiced",     limit: 8
    t.integer "q605a",               limit: 8
    t.integer "q605a_practiced",     limit: 8
    t.integer "q605b",               limit: 8
    t.integer "q605b_practiced",     limit: 8
    t.integer "q606a",               limit: 8
    t.integer "q606a_practiced",     limit: 8
    t.integer "q606b",               limit: 8
    t.integer "q606b_practiced",     limit: 8
    t.integer "q606c",               limit: 8
    t.integer "q606c_practiced",     limit: 8
    t.integer "q606d",               limit: 8
    t.integer "q606d_practiced",     limit: 8
    t.integer "q606e",               limit: 8
    t.integer "q606e_practiced",     limit: 8
    t.integer "q606f",               limit: 8
    t.integer "q606f_practiced",     limit: 8
    t.integer "q606g",               limit: 8
    t.integer "q606g_practiced",     limit: 8
    t.integer "q606h",               limit: 8
    t.integer "q606h_practiced",     limit: 8
    t.integer "q606i",               limit: 8
    t.integer "q606i_practiced",     limit: 8
    t.string  "q701",                limit: nil
    t.integer "p4_resident_id"
  end

  create_table "y5_residency_programs", id: false, force: true do |t|
    t.string  "p4_program_id",        limit: nil, null: false
    t.integer "resleave",             limit: 8
    t.integer "resleavepgy1",         limit: 8
    t.integer "resleavepgy2",         limit: 8
    t.integer "resleavepgy3",         limit: 8
    t.integer "resleavepgy4",         limit: 8
    t.integer "facleave",             limit: 8
    t.integer "progdir_leave",        limit: 8
    t.text    "progdir"
    t.integer "siteeval_leave",       limit: 8
    t.text    "siteeval"
    t.integer "assocprogdir_leave",   limit: 8
    t.text    "assocprogdir"
    t.integer "rescoord_leave",       limit: 8
    t.text    "rescoord"
    t.integer "otherfacleave1_leave", limit: 8
    t.text    "otherfacleave1"
    t.text    "otherfacleave1txt"
    t.integer "otherfacleave2_leave", limit: 8
    t.text    "otherfacleave2"
    t.text    "otherfacleave2txt"
    t.integer "numqipgy1res",         limit: 8
    t.integer "numqipgy2res",         limit: 8
    t.integer "numqipgy3res",         limit: 8
    t.integer "numqipgy4res",         limit: 8
    t.integer "numrschpgy1res",       limit: 8
    t.integer "numrschpgy2res",       limit: 8
    t.integer "numrschpgy3res",       limit: 8
    t.integer "numrschpgy4res",       limit: 8
    t.integer "nopgy4",               limit: 8
    t.decimal "pctpeerreview"
    t.decimal "pctnonpeerreview"
    t.decimal "pctpresenting"
    t.integer "rps",                  limit: 8
    t.integer "ratefacdevel",         limit: 8
    t.integer "ratefacmorale",        limit: 8
    t.integer "rateresmorale",        limit: 8
    t.integer "ratesatisfaction",     limit: 8
  end

  create_table "y5_resident_responses", force: true do |t|
    t.string  "p4residency_abfm_id",      limit: nil, null: false
    t.string  "p4_program_id",            limit: nil
    t.string  "contclin",                 limit: nil
    t.integer "abfm_last_four",           limit: 8
    t.integer "age",                      limit: 8
    t.integer "gender",                   limit: 8
    t.integer "race_c",                   limit: 8
    t.integer "race_aa",                  limit: 8
    t.integer "race_ap",                  limit: 8
    t.integer "race_in",                  limit: 8
    t.integer "race_o",                   limit: 8
    t.string  "raceothertxt",             limit: nil
    t.integer "ethnicity",                limit: 8
    t.integer "marital",                  limit: 8
    t.integer "children",                 limit: 8
    t.integer "many",                     limit: 8
    t.integer "medicalafterbs",           limit: 8
    t.decimal "yearsbeforemedschool"
    t.string  "describebeforemed",        limit: nil
    t.integer "usamedschool",             limit: 8
    t.integer "firstgenerationcollege",   limit: 8
    t.integer "firstgenphysician",        limit: 8
    t.integer "firstfamilyphysician",     limit: 8
    t.string  "medgraddate",              limit: nil
    t.integer "programyear",              limit: 8
    t.string  "otherprogramyear",         limit: nil
    t.integer "influence",                limit: 8
    t.integer "masters",                  limit: 8
    t.string  "mastersdegree",            limit: nil
    t.string  "mastersdegreeother",       limit: nil
    t.integer "goals",                    limit: 8
    t.integer "facultyteaching",          limit: 8
    t.integer "facultysupervising",       limit: 8
    t.integer "participationjournalclub", limit: 8
    t.integer "participationconferences", limit: 8
    t.integer "feedback",                 limit: 8
    t.integer "evaluatefaculty",          limit: 8
    t.integer "evaluateprogram",          limit: 8
    t.integer "speakfreely",              limit: 8
    t.integer "othertraineesinterfere",   limit: 8
    t.integer "satisfied",                limit: 8
    t.integer "strengthsfacteaching",     limit: 8
    t.integer "strengthsoverallcurr",     limit: 8
    t.integer "strengthscurrchange",      limit: 8
    t.integer "strengthspracchange",      limit: 8
    t.integer "strengthscompetence",      limit: 8
    t.integer "strengthsp4innovations",   limit: 8
    t.integer "strengthsp4implement",     limit: 8
    t.integer "importance1",              limit: 8
    t.integer "importance2",              limit: 8
    t.integer "importance3",              limit: 8
    t.integer "importance4",              limit: 8
    t.integer "importance5",              limit: 8
    t.integer "importance6",              limit: 8
    t.integer "importance7",              limit: 8
    t.integer "importance8",              limit: 8
    t.integer "importance9",              limit: 8
    t.integer "importance10",             limit: 8
    t.integer "importance11",             limit: 8
    t.integer "importance12",             limit: 8
    t.integer "importance13",             limit: 8
    t.integer "importance14",             limit: 8
    t.integer "importance15",             limit: 8
    t.integer "importance16",             limit: 8
    t.integer "importance17",             limit: 8
    t.integer "importance18",             limit: 8
    t.integer "importance19",             limit: 8
    t.integer "importance20",             limit: 8
    t.integer "importance21",             limit: 8
    t.integer "importance22",             limit: 8
    t.integer "importance23",             limit: 8
    t.integer "importance24",             limit: 8
    t.integer "importance25",             limit: 8
    t.integer "importance26",             limit: 8
    t.integer "importance27",             limit: 8
    t.integer "p4_resident_id"
  end

  create_table "y6_graduate_responses", force: true do |t|
    t.integer "graduateid",          limit: 8
    t.string  "p4_program_id",       limit: nil
    t.integer "grad_year",           limit: 8
    t.integer "abfm_last_four",      limit: 8
    t.integer "paper",               limit: 8
    t.integer "finished",            limit: 8
    t.integer "max_slide",           limit: 8
    t.string  "created_at",          limit: nil
    t.string  "updated_at",          limit: nil
    t.integer "q101a",               limit: 8
    t.integer "q101b",               limit: 8
    t.integer "q101c",               limit: 8
    t.integer "q101d",               limit: 8
    t.integer "q102a",               limit: 8
    t.integer "q102b",               limit: 8
    t.integer "q102c",               limit: 8
    t.integer "q102d",               limit: 8
    t.string  "q102d_other",         limit: nil
    t.integer "q103a",               limit: 8
    t.integer "q103b_1",             limit: 8
    t.integer "q103b_2",             limit: 8
    t.integer "q103b_3",             limit: 8
    t.integer "q103b_4",             limit: 8
    t.integer "q103b_5",             limit: 8
    t.integer "q103b_6",             limit: 8
    t.integer "q103b_7",             limit: 8
    t.integer "q103b_8",             limit: 8
    t.integer "q103b_9",             limit: 8
    t.integer "q103b_10",            limit: 8
    t.string  "q103b_other",         limit: nil
    t.string  "q104",                limit: nil
    t.decimal "q105"
    t.integer "q106",                limit: 8
    t.integer "q107_1",              limit: 8
    t.integer "q107_2",              limit: 8
    t.integer "q107_3",              limit: 8
    t.integer "q107_4",              limit: 8
    t.integer "q107_5",              limit: 8
    t.integer "q107_6",              limit: 8
    t.integer "q107_7",              limit: 8
    t.string  "q107_other",          limit: nil
    t.integer "q108",                limit: 8
    t.integer "q201",                limit: 8
    t.string  "q201_other",          limit: nil
    t.integer "q202_a",              limit: 8
    t.integer "q202_b",              limit: 8
    t.integer "q202_c",              limit: 8
    t.integer "q202_d",              limit: 8
    t.integer "q202_e",              limit: 8
    t.integer "q202_f",              limit: 8
    t.integer "q202_g",              limit: 8
    t.integer "q202_h",              limit: 8
    t.string  "q202_other",          limit: nil
    t.integer "q202_none",           limit: 8
    t.integer "q203",                limit: 8
    t.decimal "q204"
    t.integer "q205",                limit: 8
    t.decimal "q206"
    t.decimal "q207a"
    t.decimal "q207b"
    t.decimal "q207c"
    t.decimal "q207d"
    t.decimal "q207e"
    t.decimal "q207f"
    t.integer "q207f_other_present", limit: 8
    t.string  "q207f_other",         limit: nil
    t.integer "q208",                limit: 8
    t.integer "q301a",               limit: 8
    t.integer "q301b",               limit: 8
    t.integer "q301c",               limit: 8
    t.integer "q301d",               limit: 8
    t.integer "q401",                limit: 8
    t.integer "q402",                limit: 8
    t.integer "q403",                limit: 8
    t.integer "q404",                limit: 8
    t.integer "q405",                limit: 8
    t.integer "q406",                limit: 8
    t.integer "q407",                limit: 8
    t.integer "q408",                limit: 8
    t.integer "q409",                limit: 8
    t.integer "q410",                limit: 8
    t.integer "q411",                limit: 8
    t.integer "q412",                limit: 8
    t.integer "q413",                limit: 8
    t.integer "q414",                limit: 8
    t.integer "q415",                limit: 8
    t.integer "q416",                limit: 8
    t.integer "q417",                limit: 8
    t.integer "q418",                limit: 8
    t.integer "q419",                limit: 8
    t.integer "q420",                limit: 8
    t.integer "q421",                limit: 8
    t.integer "q422",                limit: 8
    t.integer "q423",                limit: 8
    t.integer "q424",                limit: 8
    t.integer "q425",                limit: 8
    t.integer "q426",                limit: 8
    t.integer "q427",                limit: 8
    t.integer "q428",                limit: 8
    t.integer "q429",                limit: 8
    t.integer "q430",                limit: 8
    t.integer "q501a",               limit: 8
    t.integer "q501b",               limit: 8
    t.integer "q501c",               limit: 8
    t.integer "q501d",               limit: 8
    t.integer "q501e",               limit: 8
    t.integer "q501f",               limit: 8
    t.integer "q501g",               limit: 8
    t.integer "q502",                limit: 8
    t.integer "q503",                limit: 8
    t.integer "q503_group",          limit: 8
    t.integer "q503a",               limit: 8
    t.integer "q503b",               limit: 8
    t.integer "q504",                limit: 8
    t.string  "q504_describe",       limit: nil
    t.integer "q505_1",              limit: 8
    t.integer "q505_2",              limit: 8
    t.integer "q505_3",              limit: 8
    t.integer "q505_4",              limit: 8
    t.string  "q505_other",          limit: nil
    t.integer "q505_none",           limit: 8
    t.integer "q506a",               limit: 8
    t.integer "q506a_practiced",     limit: 8
    t.integer "q506b",               limit: 8
    t.integer "q506b_practiced",     limit: 8
    t.integer "q506c",               limit: 8
    t.integer "q506c_practiced",     limit: 8
    t.integer "q506d",               limit: 8
    t.integer "q506d_practiced",     limit: 8
    t.integer "q506e",               limit: 8
    t.integer "q506e_practiced",     limit: 8
    t.integer "q507a",               limit: 8
    t.integer "q507a_practiced",     limit: 8
    t.integer "q507b",               limit: 8
    t.integer "q507b_practiced",     limit: 8
    t.integer "q507c",               limit: 8
    t.integer "q507c_practiced",     limit: 8
    t.integer "q507d",               limit: 8
    t.integer "q507d_practiced",     limit: 8
    t.integer "q507e",               limit: 8
    t.integer "q507e_practiced",     limit: 8
    t.integer "q507f",               limit: 8
    t.integer "q507f_practiced",     limit: 8
    t.integer "q507g",               limit: 8
    t.integer "q507g_practiced",     limit: 8
    t.integer "q507h",               limit: 8
    t.integer "q507h_practiced",     limit: 8
    t.integer "q507i",               limit: 8
    t.integer "q507i_practiced",     limit: 8
    t.integer "q507j",               limit: 8
    t.integer "q507j_practiced",     limit: 8
    t.integer "q508a",               limit: 8
    t.integer "q508a_practiced",     limit: 8
    t.integer "q508b",               limit: 8
    t.integer "q508b_practiced",     limit: 8
    t.integer "q508c",               limit: 8
    t.integer "q508c_practiced",     limit: 8
    t.integer "q508d",               limit: 8
    t.integer "q508d_practiced",     limit: 8
    t.integer "q508e",               limit: 8
    t.integer "q508e_practiced",     limit: 8
    t.integer "q508f",               limit: 8
    t.integer "q508f_practiced",     limit: 8
    t.integer "q508g",               limit: 8
    t.integer "q508g_practiced",     limit: 8
    t.integer "q509a",               limit: 8
    t.integer "q509a_practiced",     limit: 8
    t.integer "q509b",               limit: 8
    t.integer "q509b_practiced",     limit: 8
    t.integer "q509c",               limit: 8
    t.integer "q509c_practiced",     limit: 8
    t.integer "q510a",               limit: 8
    t.integer "q510a_practiced",     limit: 8
    t.integer "q510b",               limit: 8
    t.integer "q510b_practiced",     limit: 8
    t.integer "q510c",               limit: 8
    t.integer "q510c_practiced",     limit: 8
    t.integer "q510d",               limit: 8
    t.integer "q510d_practiced",     limit: 8
    t.integer "q510e",               limit: 8
    t.integer "q510e_practiced",     limit: 8
    t.integer "q510f",               limit: 8
    t.integer "q510f_practiced",     limit: 8
    t.integer "q510g",               limit: 8
    t.integer "q510g_practiced",     limit: 8
    t.integer "q510h",               limit: 8
    t.integer "q510h_practiced",     limit: 8
    t.integer "q511a",               limit: 8
    t.integer "q511a_practiced",     limit: 8
    t.integer "q511b",               limit: 8
    t.integer "q511b_practiced",     limit: 8
    t.integer "q511c",               limit: 8
    t.integer "q511c_practiced",     limit: 8
    t.integer "q512a",               limit: 8
    t.integer "q512a_practiced",     limit: 8
    t.integer "q512b",               limit: 8
    t.integer "q512b_practiced",     limit: 8
    t.integer "q513a",               limit: 8
    t.integer "q513a_practiced",     limit: 8
    t.integer "q513b",               limit: 8
    t.integer "q513b_practiced",     limit: 8
    t.integer "q513c",               limit: 8
    t.integer "q513c_practiced",     limit: 8
    t.integer "q513d",               limit: 8
    t.integer "q513d_practiced",     limit: 8
    t.integer "q513e",               limit: 8
    t.integer "q513e_practiced",     limit: 8
    t.integer "q514a",               limit: 8
    t.integer "q514a_practiced",     limit: 8
    t.integer "q514b",               limit: 8
    t.integer "q514b_practiced",     limit: 8
    t.integer "q514c",               limit: 8
    t.integer "q514c_practiced",     limit: 8
    t.integer "q514d",               limit: 8
    t.integer "q514d_practiced",     limit: 8
    t.integer "q514e",               limit: 8
    t.integer "q514e_practiced",     limit: 8
    t.integer "q514f",               limit: 8
    t.integer "q514f_practiced",     limit: 8
    t.integer "q514g",               limit: 8
    t.integer "q514g_practiced",     limit: 8
    t.integer "q514h",               limit: 8
    t.integer "q514h_practiced",     limit: 8
    t.integer "q514i",               limit: 8
    t.integer "q514i_practiced",     limit: 8
    t.integer "q514j",               limit: 8
    t.integer "q514j_practiced",     limit: 8
    t.integer "q601a",               limit: 8
    t.integer "q601a_practiced",     limit: 8
    t.integer "q601b",               limit: 8
    t.integer "q601b_practiced",     limit: 8
    t.integer "q601c",               limit: 8
    t.integer "q601c_practiced",     limit: 8
    t.integer "q601d",               limit: 8
    t.integer "q601d_practiced",     limit: 8
    t.integer "q601e",               limit: 8
    t.integer "q601e_practiced",     limit: 8
    t.integer "q602a",               limit: 8
    t.integer "q602a_practiced",     limit: 8
    t.integer "q602b",               limit: 8
    t.integer "q602b_practiced",     limit: 8
    t.integer "q602c",               limit: 8
    t.integer "q602c_practiced",     limit: 8
    t.integer "q602d",               limit: 8
    t.integer "q602d_practiced",     limit: 8
    t.integer "q602e",               limit: 8
    t.integer "q602e_practiced",     limit: 8
    t.integer "q603a",               limit: 8
    t.integer "q603a_practiced",     limit: 8
    t.integer "q603b",               limit: 8
    t.integer "q603b_practiced",     limit: 8
    t.integer "q603c",               limit: 8
    t.integer "q603c_practiced",     limit: 8
    t.integer "q603d",               limit: 8
    t.integer "q603d_practiced",     limit: 8
    t.integer "q603e",               limit: 8
    t.integer "q603e_practiced",     limit: 8
    t.integer "q603f",               limit: 8
    t.integer "q603f_practiced",     limit: 8
    t.integer "q604a",               limit: 8
    t.integer "q604a_practiced",     limit: 8
    t.integer "q604b",               limit: 8
    t.integer "q604b_practiced",     limit: 8
    t.integer "q604c",               limit: 8
    t.integer "q604c_practiced",     limit: 8
    t.integer "q604d",               limit: 8
    t.integer "q604d_practiced",     limit: 8
    t.integer "q605a",               limit: 8
    t.integer "q605a_practiced",     limit: 8
    t.integer "q605b",               limit: 8
    t.integer "q605b_practiced",     limit: 8
    t.integer "q606a",               limit: 8
    t.integer "q606a_practiced",     limit: 8
    t.integer "q606b",               limit: 8
    t.integer "q606b_practiced",     limit: 8
    t.integer "q606c",               limit: 8
    t.integer "q606c_practiced",     limit: 8
    t.integer "q606d",               limit: 8
    t.integer "q606d_practiced",     limit: 8
    t.integer "q606e",               limit: 8
    t.integer "q606e_practiced",     limit: 8
    t.integer "q606f",               limit: 8
    t.integer "q606f_practiced",     limit: 8
    t.integer "q606g",               limit: 8
    t.integer "q606g_practiced",     limit: 8
    t.integer "q606h",               limit: 8
    t.integer "q606h_practiced",     limit: 8
    t.integer "q606i",               limit: 8
    t.integer "q606i_practiced",     limit: 8
    t.string  "q701",                limit: nil
    t.integer "p4_resident_id"
  end

  create_table "y7_graduate_responses", force: true do |t|
    t.integer "graduateid",          limit: 8
    t.string  "p4_program_id",       limit: nil
    t.integer "grad_year",           limit: 8
    t.integer "abfm_last_four",      limit: 8
    t.integer "paper",               limit: 8
    t.integer "finished",            limit: 8
    t.integer "max_slide",           limit: 8
    t.string  "created_at",          limit: nil
    t.string  "updated_at",          limit: nil
    t.integer "q101a",               limit: 8
    t.integer "q101b",               limit: 8
    t.integer "q101c",               limit: 8
    t.integer "q101d",               limit: 8
    t.integer "q102a",               limit: 8
    t.integer "q102b",               limit: 8
    t.integer "q102c",               limit: 8
    t.integer "q102d",               limit: 8
    t.string  "q102d_other",         limit: nil
    t.integer "q103a",               limit: 8
    t.integer "q103b_1",             limit: 8
    t.integer "q103b_2",             limit: 8
    t.integer "q103b_3",             limit: 8
    t.integer "q103b_4",             limit: 8
    t.integer "q103b_5",             limit: 8
    t.integer "q103b_6",             limit: 8
    t.integer "q103b_7",             limit: 8
    t.integer "q103b_8",             limit: 8
    t.integer "q103b_9",             limit: 8
    t.integer "q103b_10",            limit: 8
    t.string  "q103b_other",         limit: nil
    t.string  "q104",                limit: nil
    t.decimal "q105"
    t.integer "q106",                limit: 8
    t.integer "q107_1",              limit: 8
    t.integer "q107_2",              limit: 8
    t.integer "q107_3",              limit: 8
    t.integer "q107_4",              limit: 8
    t.integer "q107_5",              limit: 8
    t.integer "q107_6",              limit: 8
    t.integer "q107_7",              limit: 8
    t.string  "q107_other",          limit: nil
    t.integer "q108",                limit: 8
    t.integer "q201",                limit: 8
    t.string  "q201_other",          limit: nil
    t.integer "q202_a",              limit: 8
    t.integer "q202_b",              limit: 8
    t.integer "q202_c",              limit: 8
    t.integer "q202_d",              limit: 8
    t.integer "q202_e",              limit: 8
    t.integer "q202_f",              limit: 8
    t.integer "q202_g",              limit: 8
    t.integer "q202_h",              limit: 8
    t.string  "q202_other",          limit: nil
    t.integer "q202_none",           limit: 8
    t.integer "q203",                limit: 8
    t.decimal "q204"
    t.integer "q205",                limit: 8
    t.decimal "q206"
    t.decimal "q207a"
    t.decimal "q207b"
    t.decimal "q207c"
    t.decimal "q207d"
    t.decimal "q207e"
    t.decimal "q207f"
    t.integer "q207f_other_present", limit: 8
    t.string  "q207f_other",         limit: nil
    t.integer "q208",                limit: 8
    t.integer "q301a",               limit: 8
    t.integer "q301b",               limit: 8
    t.integer "q301c",               limit: 8
    t.integer "q301d",               limit: 8
    t.integer "q401",                limit: 8
    t.integer "q402",                limit: 8
    t.integer "q403",                limit: 8
    t.integer "q404",                limit: 8
    t.integer "q405",                limit: 8
    t.integer "q406",                limit: 8
    t.integer "q407",                limit: 8
    t.integer "q408",                limit: 8
    t.integer "q409",                limit: 8
    t.integer "q410",                limit: 8
    t.integer "q411",                limit: 8
    t.integer "q412",                limit: 8
    t.integer "q413",                limit: 8
    t.integer "q414",                limit: 8
    t.integer "q415",                limit: 8
    t.integer "q416",                limit: 8
    t.integer "q417",                limit: 8
    t.integer "q418",                limit: 8
    t.integer "q419",                limit: 8
    t.integer "q420",                limit: 8
    t.integer "q421",                limit: 8
    t.integer "q422",                limit: 8
    t.integer "q423",                limit: 8
    t.integer "q424",                limit: 8
    t.integer "q425",                limit: 8
    t.integer "q426",                limit: 8
    t.integer "q427",                limit: 8
    t.integer "q428",                limit: 8
    t.integer "q429",                limit: 8
    t.integer "q430",                limit: 8
    t.integer "q501a",               limit: 8
    t.integer "q501b",               limit: 8
    t.integer "q501c",               limit: 8
    t.integer "q501d",               limit: 8
    t.integer "q501e",               limit: 8
    t.integer "q501f",               limit: 8
    t.integer "q501g",               limit: 8
    t.integer "q502",                limit: 8
    t.integer "q503",                limit: 8
    t.integer "q503_group",          limit: 8
    t.integer "q503a",               limit: 8
    t.integer "q503b",               limit: 8
    t.integer "q504",                limit: 8
    t.string  "q504_describe",       limit: nil
    t.integer "q505_1",              limit: 8
    t.integer "q505_2",              limit: 8
    t.integer "q505_3",              limit: 8
    t.integer "q505_4",              limit: 8
    t.string  "q505_other",          limit: nil
    t.integer "q505_none",           limit: 8
    t.integer "q506a",               limit: 8
    t.integer "q506a_practiced",     limit: 8
    t.integer "q506b",               limit: 8
    t.integer "q506b_practiced",     limit: 8
    t.integer "q506c",               limit: 8
    t.integer "q506c_practiced",     limit: 8
    t.integer "q506d",               limit: 8
    t.integer "q506d_practiced",     limit: 8
    t.integer "q506e",               limit: 8
    t.integer "q506e_practiced",     limit: 8
    t.integer "q507a",               limit: 8
    t.integer "q507a_practiced",     limit: 8
    t.integer "q507b",               limit: 8
    t.integer "q507b_practiced",     limit: 8
    t.integer "q507c",               limit: 8
    t.integer "q507c_practiced",     limit: 8
    t.integer "q507d",               limit: 8
    t.integer "q507d_practiced",     limit: 8
    t.integer "q507e",               limit: 8
    t.integer "q507e_practiced",     limit: 8
    t.integer "q507f",               limit: 8
    t.integer "q507f_practiced",     limit: 8
    t.integer "q507g",               limit: 8
    t.integer "q507g_practiced",     limit: 8
    t.integer "q507h",               limit: 8
    t.integer "q507h_practiced",     limit: 8
    t.integer "q507i",               limit: 8
    t.integer "q507i_practiced",     limit: 8
    t.integer "q507j",               limit: 8
    t.integer "q507j_practiced",     limit: 8
    t.integer "q508a",               limit: 8
    t.integer "q508a_practiced",     limit: 8
    t.integer "q508b",               limit: 8
    t.integer "q508b_practiced",     limit: 8
    t.integer "q508c",               limit: 8
    t.integer "q508c_practiced",     limit: 8
    t.integer "q508d",               limit: 8
    t.integer "q508d_practiced",     limit: 8
    t.integer "q508e",               limit: 8
    t.integer "q508e_practiced",     limit: 8
    t.integer "q508f",               limit: 8
    t.integer "q508f_practiced",     limit: 8
    t.integer "q508g",               limit: 8
    t.integer "q508g_practiced",     limit: 8
    t.integer "q509a",               limit: 8
    t.integer "q509a_practiced",     limit: 8
    t.integer "q509b",               limit: 8
    t.integer "q509b_practiced",     limit: 8
    t.integer "q509c",               limit: 8
    t.integer "q509c_practiced",     limit: 8
    t.integer "q510a",               limit: 8
    t.integer "q510a_practiced",     limit: 8
    t.integer "q510b",               limit: 8
    t.integer "q510b_practiced",     limit: 8
    t.integer "q510c",               limit: 8
    t.integer "q510c_practiced",     limit: 8
    t.integer "q510d",               limit: 8
    t.integer "q510d_practiced",     limit: 8
    t.integer "q510e",               limit: 8
    t.integer "q510e_practiced",     limit: 8
    t.integer "q510f",               limit: 8
    t.integer "q510f_practiced",     limit: 8
    t.integer "q510g",               limit: 8
    t.integer "q510g_practiced",     limit: 8
    t.integer "q510h",               limit: 8
    t.integer "q510h_practiced",     limit: 8
    t.integer "q511a",               limit: 8
    t.integer "q511a_practiced",     limit: 8
    t.integer "q511b",               limit: 8
    t.integer "q511b_practiced",     limit: 8
    t.integer "q511c",               limit: 8
    t.integer "q511c_practiced",     limit: 8
    t.integer "q512a",               limit: 8
    t.integer "q512a_practiced",     limit: 8
    t.integer "q512b",               limit: 8
    t.integer "q512b_practiced",     limit: 8
    t.integer "q513a",               limit: 8
    t.integer "q513a_practiced",     limit: 8
    t.integer "q513b",               limit: 8
    t.integer "q513b_practiced",     limit: 8
    t.integer "q513c",               limit: 8
    t.integer "q513c_practiced",     limit: 8
    t.integer "q513d",               limit: 8
    t.integer "q513d_practiced",     limit: 8
    t.integer "q513e",               limit: 8
    t.integer "q513e_practiced",     limit: 8
    t.integer "q514a",               limit: 8
    t.integer "q514a_practiced",     limit: 8
    t.integer "q514b",               limit: 8
    t.integer "q514b_practiced",     limit: 8
    t.integer "q514c",               limit: 8
    t.integer "q514c_practiced",     limit: 8
    t.integer "q514d",               limit: 8
    t.integer "q514d_practiced",     limit: 8
    t.integer "q514e",               limit: 8
    t.integer "q514e_practiced",     limit: 8
    t.integer "q514f",               limit: 8
    t.integer "q514f_practiced",     limit: 8
    t.integer "q514g",               limit: 8
    t.integer "q514g_practiced",     limit: 8
    t.integer "q514h",               limit: 8
    t.integer "q514h_practiced",     limit: 8
    t.integer "q514i",               limit: 8
    t.integer "q514i_practiced",     limit: 8
    t.integer "q514j",               limit: 8
    t.integer "q514j_practiced",     limit: 8
    t.integer "q601a",               limit: 8
    t.integer "q601a_practiced",     limit: 8
    t.integer "q601b",               limit: 8
    t.integer "q601b_practiced",     limit: 8
    t.integer "q601c",               limit: 8
    t.integer "q601c_practiced",     limit: 8
    t.integer "q601d",               limit: 8
    t.integer "q601d_practiced",     limit: 8
    t.integer "q601e",               limit: 8
    t.integer "q601e_practiced",     limit: 8
    t.integer "q602a",               limit: 8
    t.integer "q602a_practiced",     limit: 8
    t.integer "q602b",               limit: 8
    t.integer "q602b_practiced",     limit: 8
    t.integer "q602c",               limit: 8
    t.integer "q602c_practiced",     limit: 8
    t.integer "q602d",               limit: 8
    t.integer "q602d_practiced",     limit: 8
    t.integer "q602e",               limit: 8
    t.integer "q602e_practiced",     limit: 8
    t.integer "q603a",               limit: 8
    t.integer "q603a_practiced",     limit: 8
    t.integer "q603b",               limit: 8
    t.integer "q603b_practiced",     limit: 8
    t.integer "q603c",               limit: 8
    t.integer "q603c_practiced",     limit: 8
    t.integer "q603d",               limit: 8
    t.integer "q603d_practiced",     limit: 8
    t.integer "q603e",               limit: 8
    t.integer "q603e_practiced",     limit: 8
    t.integer "q603f",               limit: 8
    t.integer "q603f_practiced",     limit: 8
    t.integer "q604a",               limit: 8
    t.integer "q604a_practiced",     limit: 8
    t.integer "q604b",               limit: 8
    t.integer "q604b_practiced",     limit: 8
    t.integer "q604c",               limit: 8
    t.integer "q604c_practiced",     limit: 8
    t.integer "q604d",               limit: 8
    t.integer "q604d_practiced",     limit: 8
    t.integer "q605a",               limit: 8
    t.integer "q605a_practiced",     limit: 8
    t.integer "q605b",               limit: 8
    t.integer "q605b_practiced",     limit: 8
    t.integer "q606a",               limit: 8
    t.integer "q606a_practiced",     limit: 8
    t.integer "q606b",               limit: 8
    t.integer "q606b_practiced",     limit: 8
    t.integer "q606c",               limit: 8
    t.integer "q606c_practiced",     limit: 8
    t.integer "q606d",               limit: 8
    t.integer "q606d_practiced",     limit: 8
    t.integer "q606e",               limit: 8
    t.integer "q606e_practiced",     limit: 8
    t.integer "q606f",               limit: 8
    t.integer "q606f_practiced",     limit: 8
    t.integer "q606g",               limit: 8
    t.integer "q606g_practiced",     limit: 8
    t.integer "q606h",               limit: 8
    t.integer "q606h_practiced",     limit: 8
    t.integer "q606i",               limit: 8
    t.integer "q606i_practiced",     limit: 8
    t.string  "q701",                limit: nil
    t.integer "p4_resident_id"
  end

end
