class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product_color

  validates :status, inclusion: { in: %w[paid cancelled complete shipped collected returned exchanged] }
  validates :quantity, numericality: { greater_than: 0 }

  def name
    product_color.name
  end

  def product_id
    product_color.product_size.product_id
  end

  def price
    product_color.price
  end

  def total_price
    product_color.price * quantity
  end

  def image_url
    product_color.image_url
  end

  def size?
    if product_color.size != 'One Size'
      true
    else
      false
    end
  end

  def size
    if product_color.size
      product_color.size
    else
      product_color.size_uk
    end
  end

  def color
    product_color.color
  end

  def returnable?
    status == "shipped" && order.created_at > 14.days.ago
  end

  def exchangeable?
    status == "shipped" && order.created_at > 14.days.ago
  end

  def return!
    update(status: "returned")
  end

  def exchange!
    update(status: "exchanged")
  end

  def cancel!
    update(status: "cancelled")
  end

  def complete!
    update(status: "complete")
  end

  def shipped!
    update(status: "shipped")
  end
end
