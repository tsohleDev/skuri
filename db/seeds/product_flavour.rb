product_flavour_data = [{
  product_id: Product.find_by(name: 'Protein Delite').id,
  flavour_id: Flavour.find_by(name: 'Chocolate').id,
}, {
  product_id: Product.find_by(name: 'Protein Delite').id,
  flavour_id: Flavour.find_by(name: 'Vanilla').id,
},
{
  product_id: Product.find_by(name: 'Formula 1').id,
  flavour_id: Flavour.find_by(name: 'Strawberry').id,
},
{
  product_id: Product.find_by(name: 'Formula 1').id,
  flavour_id: Flavour.find_by(name: 'Banana').id,
},
]

product_flavour_data.each do |data|
  ProductFlavour.find_or_create_by(data)
end

puts "Product Flavours created successfully"
