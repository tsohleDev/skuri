# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# import the rb files from the seeds folder
require_relative 'seeds/brand'
require_relative 'seeds/category'
require_relative 'seeds/sub_category'
require_relative 'seeds/size'
require_relative 'seeds/product'
require_relative 'seeds/product_category'
require_relative 'seeds/colour'
require_relative 'seeds/material'
require_relative 'seeds/product_material'
require_relative 'seeds/flavour'
require_relative 'seeds/product_flavour'
require_relative 'seeds/ingredient'
require_relative 'seeds/product_ingredient'
require_relative 'seeds/product_colour_size'

