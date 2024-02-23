product_nutrition_data = [{
  product_id: Product.find_by(name: 'Formula 1').id,
  nutrition_id: Nutrition.find_by(name: 'Protein').id,
  amount_per_serving: 15.0,
  daily_value: 30.0
},
{
  product_id: Product.find_by(name: 'Formula 1').id,
  nutrition_id: Nutrition.find_by(name: 'Carbohydrates').id,
  amount_per_serving: 40.0,
  daily_value: 50.0
},
{
  product_id: Product.find_by(name: 'Formula 1').id,
  nutrition_id: Nutrition.find_by(name: 'Fats').id,
  amount_per_serving: 2.0,
  daily_value: 5.0
},
{
  product_id: Product.find_by(name: 'Protein Delite').id,
  nutrition_id: Nutrition.find_by(name: 'Protein').id,
  amount_per_serving: 15.0,
  daily_value: 30.0
},
{
  product_id: Product.find_by(name: 'Protein Delite').id,
  nutrition_id: Nutrition.find_by(name: 'Carbohydrates').id,
  amount_per_serving: 40.0,
  daily_value: 50.0
},
{
  product_id: Product.find_by(name: 'Protein Delite').id,
  nutrition_id: Nutrition.find_by(name: 'Fats').id,
  amount_per_serving: 2.0,
  daily_value: 5.0
}]

product_nutrition_data.each do |data|
  ProductNutrition.find_or_create_by!(data)
end

puts 'ProductNutrition data has been seeded successfully!'
