product_ingredients_data = [{
  product_id: Product.find_by(name: 'Classic Clean Shampoo').id,
  ingredient_id: Ingredient.find_by(name: 'Coconut Oil').id
}, {
  product_id: Product.find_by(name: 'Classic Clean Shampoo').id,
  ingredient_id: Ingredient.find_by(name: 'Spinach Powder').id
}, {
  product_id: Product.find_by(name: 'Classic Clean Conditioner').id,
  ingredient_id: Ingredient.find_by(name: 'Coconut Oil').id
}, {
  product_id: Product.find_by(name: 'Classic Clean Conditioner').id,
  ingredient_id: Ingredient.find_by(name: 'Spinach Powder').id
}, {
  product_id: Product.find_by(name: 'Formula 1').id,
  ingredient_id: Ingredient.find_by(name: 'Whey Protein Isolate').id
}, {
  product_id: Product.find_by(name: 'Formula 1').id,
  ingredient_id: Ingredient.find_by(name: 'Casein Protein').id
}, {
  product_id: Product.find_by(name: 'Protein Delite').id,
  ingredient_id: Ingredient.find_by(name: 'Whey Protein Isolate').id
}, {
  product_id: Product.find_by(name: 'Protein Delite').id,
  ingredient_id: Ingredient.find_by(name: 'Pea Protein').id
}]

product_ingredients_data.each do |product_ingredient|
  ProductIngredient.create(product_ingredient)
end

puts 'Product Ingredients created successfully!'
