class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product_flavour, optional: true
  belongs_to :product_colour_size, optional: true
  has_one :product, through: :product_flavour

  def name
    if product_flavour.present?
      product_flavour.name
    else
      product_colour_size.name
    end
  end

  def image
    if product_flavour.present?
      product_flavour.image
    else
      product_colour_size.image
    end
  end
  
  def price
    if product_flavour.present?
      product_flavour.price
    else
      product_colour_size.price
    end
  end

  def size
    product_colour_size.size.get_size
  end

  def colour
    product_colour_size.colour.name
  end

  def total_price
    quantity * product_colour_size.price
  end

  def product_id
    if product_flavour.present?
      product_flavour.product_id
    else
      product_colour_size.product_id
    end
  end
end
