# Sub category data 
sub_category_data = [{
  name: 'Extensions',
  parent_id: Category.find_by(name: 'Hair Products').id,
  description: 'Hair extensions are a type of hairpiece that adds to the length and fullness of human hair. Hair extensions are usually clipped, glued, or sewn on to other hair by incorporating additional human or synthetic hair.',
  image: 'extensions-category.jpg'
}, {
  name: 'Wash',
  parent_id: Category.find_by(name: 'Hair Products').id,
  description: 'Washing hair removes excess sweat and oil, as well as unwanted products from the hair and scalp. Often hair is washed as part of a shower or bathing with shampoo, a specialized surfactant. Shampoos work by applying water and shampoo to the hair. The shampoo breaks the surface tension of the water, allowing the hair to become soaked. This is known as the wetting action. The wetting action is caused by the head of the shampoo molecule attracting the water to the hair shaft. Conversely, the tail of the shampoo molecule is attracted to the grease, dirt and oil on the hair shaft. The physical action of shampooing makes the grease and dirt become an emulsion that is then rinsed away with water. This is known as the emulsifying action. Sulfate free shampoos are less harming on color treated hair than normal shampoos that contain sulfates. Sulfates strip away natural oils as well as hair dye. Sulfates are also responsible for the foaming effect of shampoos.',
  image: 'wash-category.png'
}, {
  name: 'Diet',
  parent_id: Category.find_by(name: 'Supplements').id,
  description: 'Dietary supplements are products intended to supplement the diet. They are not considered food and are not intended to treat, prevent, or cure diseases. Dietary supplements come in a variety of forms: traditional tablets, capsules, and powders, as well as drinks and energy bars. Popular supplements include vitamins D and E; minerals like calcium and iron; herbs such as echinacea and garlic; and products like glucosamine, probiotics, and fish oils.',
  image: 'diet-category.jpg'
}, {
  name: 'Growth',
  parent_id: Category.find_by(name: 'Supplements').id,
  description: 'Hair growth is the process of natural hair growth. Hair grows everywhere on the human skin except on the palms of our hands and the soles of our feet, but many hairs are so fine they are virtually invisible. Hair is made up of a protein called keratin that is produced in hair follicles in the outer layer of skin. As follicles produce new hair cells, old cells are being pushed out through the surface of the skin at the rate of about six inches a year. The hair you can see is actually a string of dead keratin cells. The average adult head has about 100,000 to 150,000 hairs and loses up to 100 of them a day; finding a few stray hairs on your hairbrush is not necessarily cause for alarm.',
  image: 'growth-category.jpg'
}, {
  name: 'Gym',
  parent_id: Category.find_by(name: 'Supplements').id,
  description: 'Gym supplements are products intended to supplement the diet. They are not considered food and are not intended to treat, prevent, or cure diseases. Dietary supplements come in a variety of forms: traditional tablets, capsules, and powders, as well as drinks and energy bars. Popular supplements include vitamins D and E; minerals like calcium and iron; herbs such as echinacea and garlic; and products like glucosamine, probiotics, and fish oils.',
  image: 'gym-category.jpg'
}, {
  name: 'Sneakers',
  parent_id: Category.find_by(name: 'Shoes').id,
  description: 'Sneakers are shoes primarily designed for sports or other forms of physical exercise, but which are now also widely used for everyday wear. The term generally describes a type of footwear with a flexible sole made of rubber or synthetic material and an upper part made of leather or synthetic materials. Examples of such shoes include athletic footwear such as: basketball shoes, tennis shoes, cross trainers and other shoes worn for specific sports.',
  image: 'sneakers-category.jpg'
}, {
  name: 'Heels',
  parent_id: Category.find_by(name: 'Shoes').id,
  description: 'High-heeled footwear (often abbreviated as high heels or simply heels) is footwear that raises the heel of the wearer\'s foot significantly higher than the toes. When both the heel and the toes are raised equal amounts, as in a platform shoe, it is technically not considered to be a high heel; however, there are also high-heeled platform shoes. High heels tend to give the aesthetic illusion of longer, more slender legs. High heels come in a wide variety of styles, and the heels are found in many different shapes, including stiletto, pump (court shoe), block, tapered, blade, and wedge.',
  image: 'heels-category.jpg'
}, {
  name: 'Bags',
  parent_id: Category.find_by(name: 'Accessories').id,
  description: 'A bag (also known regionally as a sack) is a common tool in the form of a non-rigid container. The use of bags predates recorded history, with the earliest bags being no more than lengths of animal skin, cotton, or woven plant fibers, folded up at the edges and secured in that shape with strings of the same material. Despite their simplicity, bags have been fundamental for the development of human civilization, as they allow people to easily collect loose materials such as berries or food grains, and to transport more items than could readily be carried in the hands.',
  image: 'bags-category.png'
}, {
  name: 'Jewellery',
  parent_id: Category.find_by(name: 'Accessories').id,
  description: 'Jewellery (British English) or jewelry (American English; see spelling differences) consists of decorative items worn for personal adornment, such as brooches, rings, necklaces, earrings, pendants, bracelets, and cufflinks. Jewellery may be attached to the body or the clothes. From a western perspective, the term is restricted to durable ornaments, excluding flowers for example. For many centuries metal, often combined with gemstones, has been the normal material for jewellery, but other materials such as shells and other plant materials may be used.',
  image: 'jewellery-category.jpg'
}]

# Create category
sub_category_data.each do |category|
  Category.find_or_create_by!(name: category[:name], description: category[:description]).image.attach(io: File.open(Rails.root.join('app/data/categories', category[:image])), filename: category[:name].downcase + '-category.jpg')
end

puts 'Sub category data created successfully'
