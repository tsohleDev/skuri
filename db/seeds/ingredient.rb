ingredients_data = [
    {
        'name': 'Whey Protein Isolate',
        'description': 'Whey protein isolate is a type of protein powder that has been filtered to remove most of the lactose, fat, and carbs. It is a complete protein, meaning it contains all nine essential amino acids.',
        'source': 'Dairy (Milk)'
    },
    {
        'name': 'Casein Protein',
        'description': 'Casein protein is a slow-digesting protein derived from milk. It forms a gel-like substance in the stomach, leading to a slow release of amino acids into the bloodstream.',
        'source': 'Dairy (Milk)'
    },
    {
        'name': 'Brown Rice Protein',
        'description': 'Brown rice protein is a plant-based protein powder made from brown rice. It is hypoallergenic and easily digestible, making it suitable for those with food sensitivities or allergies.',
        'source': 'Brown Rice'
    },
    {
        'name': 'Pea Protein',
        'description': 'Pea protein is a plant-based protein powder made from yellow peas. It is rich in essential amino acids and has been shown to support muscle growth and repair.',
        'source': 'Yellow Peas'
    },
    {
        'name': 'Almond Flour',
        'description': 'Almond flour is made from ground almonds and is commonly used as a gluten-free flour alternative. It adds a nutty flavor and moisture to baked goods.',
        'source': 'Almonds'
    },
    {
        'name': 'Coconut Oil',
        'description': 'Coconut oil is a versatile oil extracted from the meat of coconuts. It is high in saturated fats, which have been associated with various health benefits, including improved heart health and weight loss, and it can be used for cooking, baking, and skincare.',
        'source': 'Coconuts'
    },
    {
        'name': 'Spinach Powder',
        'description': 'Spinach powder is made from dehydrated spinach leaves and is rich in vitamins, minerals, and antioxidants. It can be added to smoothies, soups, or sauces for an extra nutrient boost.',
        'source': 'Spinach'
    }
]

ingredients_data.each do |ingredient|
  Ingredient.find_or_create_by!(ingredient)
end

puts 'Ingredients created successfully!'
