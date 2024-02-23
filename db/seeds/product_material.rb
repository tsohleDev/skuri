product_material_data = [
  { product_id: Product.find_by(name: 'Air Max 90').id, material_id: Material.find_by(name: 'Leather').id },
  { product_id: Product.find_by(name: 'Air Max 90').id, material_id: Material.find_by(name: 'Polyester').id },
  { product_id: Product.find_by(name: 'Air Max 90').id, material_id: Material.find_by(name: 'Rubber').id },
  { product_id: Product.find_by(name: 'Air Force 1').id, material_id: Material.find_by(name: 'Leather').id },
  { product_id: Product.find_by(name: 'Air Force 1').id, material_id: Material.find_by(name: 'Rubber').id },
  { product_id: Product.find_by(name: 'Superstar').id, material_id: Material.find_by(name: 'Leather').id },
  { product_id: Product.find_by(name: 'Stan Smith').id, material_id: Material.find_by(name: 'Leather').id },
  { product_id: Product.find_by(name: 'Suede').id, material_id: Material.find_by(name: 'Leather').id },
  { product_id: Product.find_by(name: 'Clyde').id, material_id: Material.find_by(name: 'Leather').id },
  { product_id: Product.find_by(name: 'Curry 8').id, material_id: Material.find_by(name: 'Polyester').id },
  { product_id: Product.find_by(name: 'HOVR').id, material_id: Material.find_by(name: 'Polyester').id },
  { product_id: Product.find_by(name: 'Onthego GM').id, material_id: Material.find_by(name: 'Leather').id },
  { product_id: Product.find_by(name: 'Neverfull MM').id, material_id: Material.find_by(name: 'Leather').id },
  { product_id: Product.find_by(name: 'GG Marmont').id, material_id: Material.find_by(name: 'Leather').id },
  { product_id: Product.find_by(name: 'Soho Disco').id, material_id: Material.find_by(name: 'Leather').id },
  { product_id: Product.find_by(name: 'Mr Daddy 2.0').id, material_id: Material.find_by(name: 'Stainless Steel').id },
  { product_id: Product.find_by(name: 'Mega Chief').id, material_id: Material.find_by(name: 'Stainless Steel').id },
  { product_id: Product.find_by(name: 'Classic Tennis Bracelet').id, material_id: Material.find_by(name: 'Gold').id },
  { product_id: Product.find_by(name: 'Diamond Studs').id, material_id: Material.find_by(name: 'Diamond').id },
  { product_id: Product.find_by(name: 'Brazzilian Extension').id, material_id: Material.find_by(name: 'Human Hair').id },
  { product_id: Product.find_by(name: 'Curly Extension').id, material_id: Material.find_by(name: 'Human Hair').id },
  { product_id: Product.find_by(name: 'Classic Clean Shampoo').id, material_id: Material.find_by(name: 'Plastic').id },
  { product_id: Product.find_by(name: 'Classic Clean Conditioner').id, material_id: Material.find_by(name: 'Plastic').id },
]

product_material_data.each do |product_material|
  ProductMaterial.find_or_create_by(product_material)
end

puts "ProductMaterial data seeded."
