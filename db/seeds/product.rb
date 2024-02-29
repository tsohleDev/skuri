
product_data = [{
  name: 'Air Max 90',
  description: 'The Nike Air Max 90 is a classic sneaker that has become a staple in the shoe industry. The shoe is known for its comfort and style, and has been a favorite among sneakerheads for years. The Air Max 90 is available in a variety of colorways, making it easy to find a pair that suits your style.',
  brand_id: Brand.find_by(name: 'Nike').id,
  image: 'white-air-max-90-1.jpg'
}, {
  name: 'Air Force 1',
  description: 'The Nike Air Force 1 is a classic sneaker that has been around for decades. The shoe is known for its clean and simple design, and has been a favorite among sneakerheads for years. The Air Force 1 is available in a variety of colorways, making it easy to find a pair that suits your style.',
  brand_id: Brand.find_by(name: 'Nike').id,
  image: 'white-air-force-1-1.jpg'
}, {
  name: 'Superstar',
  description: 'The Adidas Superstar is a classic sneaker that has been around for decades. The shoe is known for its iconic shell toe and three stripes, and has been a favorite among sneakerheads for years. The Superstar is available in a variety of colorways, making it easy to find a pair that suits your style.',
  brand_id: Brand.find_by(name: 'Adidas').id,
  image: 'white-superstar-1.jpg'
}, {
  name: 'Stan Smith',
  description: 'The Adidas Stan Smith is a classic sneaker that has been around for decades. The shoe is known for its clean and simple design, and has been a favorite among sneakerheads for years. The Stan Smith is available in a variety of colorways, making it easy to find a pair that suits your style.'.freeze,
  brand_id: Brand.find_by(name: 'Adidas').id,
  image: 'white-stan-smith-1.jpg'
}, {
  name: 'Suede',
  description: 'The Puma Suede is a classic sneaker that has been around for decades. The shoe is known for its clean and simple design, and has been a favorite among sneakerheads for years. The Suede is available in a variety of colorways, making it easy to find a pair that suits your style.',
  brand_id: Brand.find_by(name: 'Puma').id,
  image: 'white-suede-1.jpg'
}, {
  name: 'Clyde',
  description: 'The Puma Clyde is a classic sneaker that has been around for decades. The shoe is known for its clean and simple design, and has been a favorite among sneakerheads for years. The Clyde is available in a variety of colorways, making it easy to find a pair that suits your style.',
  brand_id: Brand.find_by(name: 'Puma').id,
  image: 'white-clyde-1.jpg'
}, {
  name: 'Curry 8',
  description: 'The Under Armour Curry 8 is a classic sneaker that has been around for decades. The shoe is known for its clean and simple design, and has been a favorite among sneakerheads for years. The Curry 8 is available in a variety of colorways, making it easy to find a pair that suits your style.',
  brand_id: Brand.find_by(name: 'Under Armour').id,
  image: 'black-curry-8-1.jpg'
}, {
  name: 'HOVR',
  description: 'The Under Armour HOVR is a classic sneaker that has been around for decades. The shoe is known for its clean and simple design, and has been a favorite among sneakerheads for years. The HOVR is available in a variety of colorways, making it easy to find a pair that suits your style.',
  brand_id: Brand.find_by(name: 'Under Armour').id,
  image: 'black-hovr-1.jpg'
}, {
  name: 'Onthego GM',
  description: 'The Louis Vuitton Onthego GM is a classic handbag that has been around for decades. The handbag is known for its clean and simple design, and has been a favorite among fashionistas for years. The Onthego GM is available in a variety of colorways, making it easy to find a handbag that suits your style.',
  brand_id: Brand.find_by(name: 'Louis Vuitton').id,
  image: 'black-onthego-gm-1.jpg'
}, {
  name: 'Neverfull MM',
  description: 'The Louis Vuitton Neverfull MM is a classic handbag that has been around for decades. The handbag is known for its clean and simple design, and has been a favorite among fashionistas for years. The Neverfull MM is available in a variety of colorways, making it easy to find a handbag that suits your style.',
  brand_id: Brand.find_by(name: 'Louis Vuitton').id,
  image: 'black-neverfull-mm-1.jpg'
}, {
  name: 'GG Marmont',
  description: 'The Gucci GG Marmont is a classic handbag that has been around for decades. The handbag is known for its clean and simple design, and has been a favorite among fashionistas for years. The GG Marmont is available in a variety of colorways, making it easy to find a handbag that suits your style.',
  brand_id: Brand.find_by(name: 'Gucci').id,
  image: 'black-gg-marmont-1.jpg'
}, {
  name: 'Soho Disco',
  description: 'The Gucci Soho Disco is a classic handbag that has been around for decades. The handbag is known for its clean and simple design, and has been a favorite among fashionistas for years. The Soho Disco is available in a variety of colorways, making it easy to find a handbag that suits your style.',
  brand_id: Brand.find_by(name: 'Gucci').id,
  image: 'brown-soho-disco-1.jpg'
}, {
  name: 'Mr Daddy 2.0',
  description: 'The Diesel Mr Daddy 2.0 is a classic watch that has been around for decades. The watch is known for its clean and simple design, and has been a favorite among watch enthusiasts for years. The Mr Daddy 2.0 is available in a variety of colorways, making it easy to find a watch that suits your style.',
  brand_id: Brand.find_by(name: 'Diesel').id,
  image: 'gold-mr-daddy-1.jpg'
}, {
  name: 'Mega Chief',
  description: 'The Diesel Mega Chief is a classic watch that has been around for decades. The watch is known for its clean and simple design, and has been a favorite among watch enthusiasts for years. The Mega Chief is available in a variety of colorways, making it easy to find a watch that suits your style.',
  brand_id: Brand.find_by(name: 'Diesel').id,
  image: 'black-mega-chief-1.jpg'
}, {
  name: 'Classic Tennis Bracelet',
  description: 'The Vrai Classic Tennis Bracelet is a classic piece of jewelry that has been around for decades. The bracelet is known for its clean and simple design, and has been a favorite among jewelry enthusiasts for years. The Classic Tennis Bracelet is available in a variety of colorways, making it easy to find a bracelet that suits your style.',
  brand_id: Brand.find_by(name: 'Vrai').id,
  image: 'gold-classic-tennis-bracelet-1.jpg'
}, {
  name: 'Diamond Studs',
  description: 'The Vrai Diamond Studs is a classic piece of jewelry that has been around for decades. The studs are known for their clean and simple design, and have been a favorite among jewelry enthusiasts for years. The Diamond Studs are available in a variety of colorways, making it easy to find a pair that suits your style.',
  brand_id: Brand.find_by(name: 'Vrai').id,
  image: 'silver-diamond-studs-1.jpg'
}, {
  name: 'Formula 1',
  description: 'The USN Formula 1 is a classic dietary supplement that has been around for decades. The supplement is known for its clean and simple design, and has been a favorite among fitness enthusiasts for years. The Formula 1 is available in a variety of flavors, making it easy to find a supplement that suits your style.',
  brand_id: Brand.find_by(name: 'USN').id,
  image: 'white-air-max-90-1.jpg'
}, {
  name: 'Protein Delite',
  description: 'The USN Protein Delite is a classic dietary supplement that has been around for decades. The supplement is known for its clean and simple design, and has been a favorite among fitness enthusiasts for years. The Protein Delite is available in a variety of flavors, making it easy to find a supplement that suits your style.',
  brand_id: Brand.find_by(name: 'USN').id,
  image: 'white-air-max-90-1.jpg'
}, { name: 'Formula 1',
  description: 'The Herbal Life Formula 1 is a classic dietary supplement that has been around for decades. The supplement is known for its clean and simple design, and has been a favorite among fitness enthusiasts for years. The Formula 1 is available in a variety of flavors, making it easy to find a supplement that suits your style.',
  brand_id: Brand.find_by(name: 'Herbal Life').id,
  image: 'white-air-max-90-1.jpg'
}, {
  name: 'Protein Delite',
  description: 'The Herbal Life Protein Delite is a classic dietary supplement that has been around for decades. The supplement is known for its clean and simple design, and has been a favorite among fitness enthusiasts for years. The Protein Delite is available in a variety of flavors, making it easy to find a supplement that suits your style.',
  brand_id: Brand.find_by(name: 'Herbal Life').id,
  image: 'white-air-max-90-1.jpg'
}, {
  name: 'Brazzilian Extension',
  description: 'The Bellami Hair Extensions are a classic hair product that has been around for decades. The hair extensions are known for their clean and simple design, and have been a favorite among hair enthusiasts for years. The Hair Extensions are available in a variety of colors, making it easy to find a pair that suits your style.',
  brand_id: Brand.find_by(name: 'Bellami').id,
  image: 'black-brazzilian-extension-1.jpg'
}, {
  name: 'Curly Extension',
  description: 'The Bellami Hair Extensions are a classic hair product that has been around for decades. The hair extensions are known for their clean and simple design, and have been a favorite among hair enthusiasts for years. The Hair Extensions are available in a variety of colors, making it easy to find a pair that suits your style.',
  brand_id: Brand.find_by(name: 'Bellami').id,
  image: 'white-air-max-90-1.jpg'
}, {
  name: 'Classic Clean Shampoo',
  description: 'The Head & Shoulders Classic Clean Shampoo is a classic hair product that has been around for decades. The shampoo is known for its clean and simple design, and has been a favorite among hair enthusiasts for years. The Classic Clean Shampoo is available in a variety of sizes, making it easy to find a bottle that suits your style.',
  brand_id: Brand.find_by(name: 'Head & Shoulders').id,
  image: 'white-air-max-90-1.jpg'
}, {
  name: 'Classic Clean Conditioner',
  description: 'The Head & Shoulders Classic Clean Shampoo is a classic hair product that has been around for decades. The shampoo is known for its clean and simple design, and has been a favorite among hair enthusiasts for years. The Classic Clean Shampoo is available in a variety of sizes, making it easy to find a bottle that suits your style.',
  brand_id: Brand.find_by(name: 'Head & Shoulders').id,
  image: 'white-air-max-90-1.jpg'
}]

product_data.each do |product|
  Product.find_or_create_by!(name: product[:name], description: product[:description], brand_id: product[:brand_id]).image.attach(io: File.open(Rails.root.join('app/data/products', product[:image])), filename: product[:image])
end

puts 'Products created successfully'

