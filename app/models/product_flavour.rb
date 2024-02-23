class ProductFlavour < ApplicationRecord
  belongs_to :product
  belongs_to :flavour
end
