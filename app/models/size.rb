class Size < ApplicationRecord
  has_many :product_colour_sizes

  def get_size
    self.size || "UK #{self.UK}" || "#{self.cm} cm"
  end
end
