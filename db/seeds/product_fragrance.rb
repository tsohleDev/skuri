product_fragrance_data = [
  {
    product_id: Product.find_by(name='Classic Clean Shampoo').id,
    fragrance_id: Fragrance.find_by(name='Fresh Linen').id
  },
  {
    product_id: Product.find_by(name='Classic Clean Conditioner').id,
    fragrance_id: Fragrance.find_by(name='Fresh Linen').id
  }
]

product_fragrance_data.each do |data|
  ProductFragrance.find_or_create_by(data)
end

puts "ProductFragrance data seeded successfully!"
