
nutrients_data= [{
  name: 'Protein',
  description: 'Protein is an essential nutrient that helps build, repair, and maintain the body\'s structures. It is made up of amino acids, which are the building blocks of the body. Protein is found in a variety of foods, including meat, dairy, and plant-based sources.',
  amount_per_serving: 20.0,
  daily_value: 40.0
}, {
  name: 'Carbohydrates',
  description: 'Carbohydrates are the body\'s main source of energy. They are found in a variety of foods, including bread, pasta, rice, and fruits. Carbohydrates are made up of sugars, starches, and fiber, and are an essential nutrient for the body.',
  amount_per_serving: 50.0,
  daily_value: 60.0
}, {
  name: 'Fats',
  description: 'Fats are an essential nutrient that helps the body absorb vitamins and minerals, and provides energy. They are found in a variety of foods, including meat, dairy, and plant-based sources. Fats are made up of fatty acids, and are an essential nutrient for the body.',
  amount_per_serving: 20.0,
  daily_value: 30.0
}, {
  name: 'Vitamins',
  description: 'Vitamins are essential nutrients that help the body function properly. They are found in a variety of foods, including fruits, vegetables, and fortified foods. Vitamins are made up of a variety of compounds, and are an essential nutrient for the body.',
  amount_per_serving: 10.0,
  daily_value: 20.0
}, {
  name: 'Minerals',
  description: 'Minerals are essential nutrients that help the body function properly. They are found in a variety of foods, including fruits, vegetables, and fortified foods. Minerals are made up of a variety of compounds, and are an essential nutrient for the body.',
  amount_per_serving: 10.0,
  daily_value: 20.0
}]

nutrients_data.each do |nutrition|
  Nutrient.find_or_create_by!(nutrition)
end

puts 'Nutritions created successfully'

