# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_02_27_112214) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "adresses", force: :cascade do |t|
    t.string "apartment"
    t.string "street"
    t.string "suburb"
    t.string "city"
    t.string "province"
    t.string "country"
    t.integer "postal_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.date "established_at"
    t.string "founders"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cart_products", force: :cascade do |t|
    t.bigint "cart_id", null: false
    t.bigint "product_flavour_id"
    t.bigint "product_colour_size_id"
    t.integer "quantity", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_cart_products_on_cart_id"
    t.index ["product_colour_size_id"], name: "index_cart_products_on_product_colour_size_id"
    t.index ["product_flavour_id"], name: "index_cart_products_on_product_flavour_id"
  end

  create_table "carts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "total_price", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_categories_on_parent_id"
  end

  create_table "colours", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "hex"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exchange_products", force: :cascade do |t|
    t.bigint "exchange_id", null: false
    t.bigint "product_flavour_id"
    t.bigint "product_colour_size_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exchange_id"], name: "index_exchange_products_on_exchange_id"
    t.index ["product_colour_size_id"], name: "index_exchange_products_on_product_colour_size_id"
    t.index ["product_flavour_id"], name: "index_exchange_products_on_product_flavour_id"
  end

  create_table "exchanges", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "adress_id", null: false
    t.decimal "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["adress_id"], name: "index_exchanges_on_adress_id"
    t.index ["user_id"], name: "index_exchanges_on_user_id"
  end

  create_table "flavours", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fragrances", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "help_messages", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_help_messages_on_user_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "materials", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "youtube_link"
    t.string "cleaning_instructions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nutritions", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "amount_per_serving"
    t.decimal "daily_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_products", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "product_flavour_id"
    t.bigint "product_colour_size_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "paid"
    t.index ["order_id"], name: "index_order_products_on_order_id"
    t.index ["product_colour_size_id"], name: "index_order_products_on_product_colour_size_id"
    t.index ["product_flavour_id"], name: "index_order_products_on_product_flavour_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "adress_id", null: false
    t.decimal "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["adress_id"], name: "index_orders_on_adress_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "product_categories", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_product_categories_on_category_id"
    t.index ["product_id"], name: "index_product_categories_on_product_id"
  end

  create_table "product_colour_sizes", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "size_id", null: false
    t.bigint "colour_id", null: false
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["colour_id"], name: "index_product_colour_sizes_on_colour_id"
    t.index ["product_id"], name: "index_product_colour_sizes_on_product_id"
    t.index ["size_id"], name: "index_product_colour_sizes_on_size_id"
  end

  create_table "product_flavours", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "flavour_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flavour_id"], name: "index_product_flavours_on_flavour_id"
    t.index ["product_id"], name: "index_product_flavours_on_product_id"
  end

  create_table "product_fragrances", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "fragrance_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fragrance_id"], name: "index_product_fragrances_on_fragrance_id"
    t.index ["product_id"], name: "index_product_fragrances_on_product_id"
  end

  create_table "product_ingredients", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "ingredient_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ingredient_id"], name: "index_product_ingredients_on_ingredient_id"
    t.index ["product_id"], name: "index_product_ingredients_on_product_id"
  end

  create_table "product_materials", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "material_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["material_id"], name: "index_product_materials_on_material_id"
    t.index ["product_id"], name: "index_product_materials_on_product_id"
  end

  create_table "product_nutritions", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "nutrition_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nutrition_id"], name: "index_product_nutritions_on_nutrition_id"
    t.index ["product_id"], name: "index_product_nutritions_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.bigint "brand_id", null: false
    t.string "name"
    t.text "description"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_products_on_brand_id"
  end

  create_table "return_products", force: :cascade do |t|
    t.bigint "return_id", null: false
    t.bigint "product_flavour_id"
    t.bigint "product_colour_size_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_colour_size_id"], name: "index_return_products_on_product_colour_size_id"
    t.index ["product_flavour_id"], name: "index_return_products_on_product_flavour_id"
    t.index ["return_id"], name: "index_return_products_on_return_id"
  end

  create_table "returns", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "adress_id", null: false
    t.decimal "refund"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["adress_id"], name: "index_returns_on_adress_id"
    t.index ["user_id"], name: "index_returns_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "product_id", null: false
    t.integer "rating"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_reviews_on_product_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "shipment_products", force: :cascade do |t|
    t.bigint "shipment_id", null: false
    t.bigint "product_flavour_id"
    t.bigint "product_colour_size_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_colour_size_id"], name: "index_shipment_products_on_product_colour_size_id"
    t.index ["product_flavour_id"], name: "index_shipment_products_on_product_flavour_id"
    t.index ["shipment_id"], name: "index_shipment_products_on_shipment_id"
  end

  create_table "shipments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "adress_id", null: false
    t.string "shipment_service"
    t.string "tracking_number"
    t.date "expected_delevery"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["adress_id"], name: "index_shipments_on_adress_id"
    t.index ["user_id"], name: "index_shipments_on_user_id"
  end

  create_table "sizes", force: :cascade do |t|
    t.string "size"
    t.integer "UK"
    t.decimal "cm"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.date "date_of_birth"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean "admin"
    t.bigint "adress_id"
    t.index ["adress_id"], name: "index_users_on_adress_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wishlist_products", force: :cascade do |t|
    t.bigint "wishlist_id", null: false
    t.bigint "product_flavour_id"
    t.bigint "product_colour_size_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_colour_size_id"], name: "index_wishlist_products_on_product_colour_size_id"
    t.index ["product_flavour_id"], name: "index_wishlist_products_on_product_flavour_id"
    t.index ["wishlist_id"], name: "index_wishlist_products_on_wishlist_id"
  end

  create_table "wishlists", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_wishlists_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "cart_products", "carts"
  add_foreign_key "cart_products", "product_colour_sizes"
  add_foreign_key "cart_products", "product_flavours"
  add_foreign_key "carts", "users"
  add_foreign_key "categories", "categories", column: "parent_id"
  add_foreign_key "exchange_products", "exchanges"
  add_foreign_key "exchange_products", "product_colour_sizes"
  add_foreign_key "exchange_products", "product_flavours"
  add_foreign_key "exchanges", "adresses"
  add_foreign_key "exchanges", "users"
  add_foreign_key "help_messages", "users"
  add_foreign_key "order_products", "orders"
  add_foreign_key "order_products", "product_colour_sizes"
  add_foreign_key "order_products", "product_flavours"
  add_foreign_key "orders", "adresses"
  add_foreign_key "orders", "users"
  add_foreign_key "product_categories", "categories"
  add_foreign_key "product_categories", "products"
  add_foreign_key "product_colour_sizes", "colours"
  add_foreign_key "product_colour_sizes", "products"
  add_foreign_key "product_colour_sizes", "sizes"
  add_foreign_key "product_flavours", "flavours"
  add_foreign_key "product_flavours", "products"
  add_foreign_key "product_fragrances", "fragrances"
  add_foreign_key "product_fragrances", "products"
  add_foreign_key "product_ingredients", "ingredients"
  add_foreign_key "product_ingredients", "products"
  add_foreign_key "product_materials", "materials"
  add_foreign_key "product_materials", "products"
  add_foreign_key "product_nutritions", "nutritions"
  add_foreign_key "product_nutritions", "products"
  add_foreign_key "products", "brands"
  add_foreign_key "return_products", "product_colour_sizes"
  add_foreign_key "return_products", "product_flavours"
  add_foreign_key "return_products", "returns"
  add_foreign_key "returns", "adresses"
  add_foreign_key "returns", "users"
  add_foreign_key "reviews", "products"
  add_foreign_key "reviews", "users"
  add_foreign_key "shipment_products", "product_colour_sizes"
  add_foreign_key "shipment_products", "product_flavours"
  add_foreign_key "shipment_products", "shipments"
  add_foreign_key "shipments", "adresses"
  add_foreign_key "shipments", "users"
  add_foreign_key "users", "adresses"
  add_foreign_key "wishlist_products", "product_colour_sizes"
  add_foreign_key "wishlist_products", "product_flavours"
  add_foreign_key "wishlist_products", "wishlists"
  add_foreign_key "wishlists", "users"
end
