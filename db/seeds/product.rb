
product_data = [{
  name: 'Air Max 90',
  description: 'The Nike Air Max 90 is a classic sneaker that has become a staple in the shoe industry. The shoe is known for its comfort and style, and has been a favorite among sneakerheads for years. The Air Max 90 is available in a variety of colorways, making it easy to find a pair that suits your style.',
  brand_id: Brand.find_by(name: 'Nike').id
}, {
  name: 'Air Force 1',
  description: 'The Nike Air Force 1 is a classic sneaker that has been around for decades. The shoe is known for its clean and simple design, and has been a favorite among sneakerheads for years. The Air Force 1 is available in a variety of colorways, making it easy to find a pair that suits your style.',
  brand_id: Brand.find_by(name: 'Nike').id
}, {
  name: 'Superstar',
  description: 'The Adidas Superstar is a classic sneaker that has been around for decades. The shoe is known for its iconic shell toe and three stripes, and has been a favorite among sneakerheads for years. The Superstar is available in a variety of colorways, making it easy to find a pair that suits your style.',
  brand_id: Brand.find_by(name: 'Adidas').id
}, {
  name: 'Stan Smith',
  description: 'The Adidas Stan Smith is a classic sneaker that has been around for decades. The shoe is known for its clean and simple design, and has been a favorite among sneakerheads for years. The Stan Smith is available in a variety of colorways, making it easy to find a pair that suits your style.'.freeze,
  brand_id: Brand.find_by(name: 'Adidas').id
}, {
  name: 'Suede',
  description: 'The Puma Suede is a classic sneaker that has been around for decades. The shoe is known for its clean and simple design, and has been a favorite among sneakerheads for years. The Suede is available in a variety of colorways, making it easy to find a pair that suits your style.',
  brand_id: Brand.find_by(name: 'Puma').id
}, {
  name: 'Clyde',
  description: 'The Puma Clyde is a classic sneaker that has been around for decades. The shoe is known for its clean and simple design, and has been a favorite among sneakerheads for years. The Clyde is available in a variety of colorways, making it easy to find a pair that suits your style.',
  brand_id: Brand.find_by(name: 'Puma').id
}, {
  name: 'Curry 8',
  description: 'The Under Armour Curry 8 is a classic sneaker that has been around for decades. The shoe is known for its clean and simple design, and has been a favorite among sneakerheads for years. The Curry 8 is available in a variety of colorways, making it easy to find a pair that suits your style.',
  brand_id: Brand.find_by(name: 'Under Armour').id
}, {
  name: 'HOVR',
  description: 'The Under Armour HOVR is a classic sneaker that has been around for decades. The shoe is known for its clean and simple design, and has been a favorite among sneakerheads for years. The HOVR is available in a variety of colorways, making it easy to find a pair that suits your style.',
  brand_id: Brand.find_by(name: 'Under Armour').id
}, {
  name: 'Onthego GM',
  description: 'The Louis Vuitton Onthego GM is a classic handbag that has been around for decades. The handbag is known for its clean and simple design, and has been a favorite among fashionistas for years. The Onthego GM is available in a variety of colorways, making it easy to find a handbag that suits your style.',
  brand_id: Brand.find_by(name: 'Louis Vuitton').id
}, {
  name: 'Neverfull MM',
  description: 'The Louis Vuitton Neverfull MM is a classic handbag that has been around for decades. The handbag is known for its clean and simple design, and has been a favorite among fashionistas for years. The Neverfull MM is available in a variety of colorways, making it easy to find a handbag that suits your style.',
  brand_id: Brand.find_by(name: 'Louis Vuitton').id
}, {
  name: 'GG Marmont',
  description: 'The Gucci GG Marmont is a classic handbag that has been around for decades. The handbag is known for its clean and simple design, and has been a favorite among fashionistas for years. The GG Marmont is available in a variety of colorways, making it easy to find a handbag that suits your style.',
  brand_id: Brand.find_by(name: 'Gucci').id
}, {
  name: 'Soho Disco',
  description: 'The Gucci Soho Disco is a classic handbag that has been around for decades. The handbag is known for its clean and simple design, and has been a favorite among fashionistas for years. The Soho Disco is available in a variety of colorways, making it easy to find a handbag that suits your style.',
  brand_id: Brand.find_by(name: 'Gucci').id
}, {
  name: 'Mr Daddy 2.0',
  description: 'The Diesel Mr Daddy 2.0 is a classic watch that has been around for decades. The watch is known for its clean and simple design, and has been a favorite among watch enthusiasts for years. The Mr Daddy 2.0 is available in a variety of colorways, making it easy to find a watch that suits your style.',
  brand_id: Brand.find_by(name: 'Diesel').id
}, {
  name: 'Mega Chief',
  description: 'The Diesel Mega Chief is a classic watch that has been around for decades. The watch is known for its clean and simple design, and has been a favorite among watch enthusiasts for years. The Mega Chief is available in a variety of colorways, making it easy to find a watch that suits your style.',
  brand_id: Brand.find_by(name: 'Diesel').id
}, {
  name: 'Classic Tennis Bracelet',
  description: 'The Vrai Classic Tennis Bracelet is a classic piece of jewelry that has been around for decades. The bracelet is known for its clean and simple design, and has been a favorite among jewelry enthusiasts for years. The Classic Tennis Bracelet is available in a variety of colorways, making it easy to find a bracelet that suits your style.',
  brand_id: Brand.find_by(name: 'Vrai').id
}, {
  name: 'Diamond Studs',
  description: 'The Vrai Diamond Studs is a classic piece of jewelry that has been around for decades. The studs are known for their clean and simple design, and have been a favorite among jewelry enthusiasts for years. The Diamond Studs are available in a variety of colorways, making it easy to find a pair that suits your style.',
  brand_id: Brand.find_by(name: 'Vrai').id
}, {
  name: 'Formula 1',
  description: 'The USN Formula 1 is a classic dietary supplement that has been around for decades. The supplement is known for its clean and simple design, and has been a favorite among fitness enthusiasts for years. The Formula 1 is available in a variety of flavors, making it easy to find a supplement that suits your style.',
  brand_id: Brand.find_by(name: 'USN').id
}, {
  name: 'Protein Delite',
  description: 'The USN Protein Delite is a classic dietary supplement that has been around for decades. The supplement is known for its clean and simple design, and has been a favorite among fitness enthusiasts for years. The Protein Delite is available in a variety of flavors, making it easy to find a supplement that suits your style.',
  brand_id: Brand.find_by(name: 'USN').id
}, {
  name: 'Formula 1',
  description: 'The Herbal Life Formula 1 is a classic dietary supplement that has been around for decades. The supplement is known for its clean and simple design, and has been a favorite among fitness enthusiasts for years. The Formula 1 is available in a variety of flavors, making it easy to find a supplement that suits your style.',
  brand_id: Brand.find_by(name: 'Herbal Life').id
}, {
  name: 'Protein Delite',
  description: 'The Herbal Life Protein Delite is a classic dietary supplement that has been around for decades. The supplement is known for its clean and simple design, and has been a favorite among fitness enthusiasts for years. The Protein Delite is available in a variety of flavors, making it easy to find a supplement that suits your style.',
  brand_id: Brand.find_by(name: 'Herbal Life').id
}, {
  name: 'Brazzilian Extension',
  description: 'The Bellami Hair Extensions are a classic hair product that has been around for decades. The hair extensions are known for their clean and simple design, and have been a favorite among hair enthusiasts for years. The Hair Extensions are available in a variety of colors, making it easy to find a pair that suits your style.',
  brand_id: Brand.find_by(name: 'Bellami').id
}, {
  name: 'Curly Extension',
  description: 'The Bellami Hair Extensions are a classic hair product that has been around for decades. The hair extensions are known for their clean and simple design, and have been a favorite among hair enthusiasts for years. The Hair Extensions are available in a variety of colors, making it easy to find a pair that suits your style.',
  brand_id: Brand.find_by(name: 'Bellami').id
}, {
  name: 'Classic Clean Shampoo',
  description: 'The Head & Shoulders Classic Clean Shampoo is a classic hair product that has been around for decades. The shampoo is known for its clean and simple design, and has been a favorite among hair enthusiasts for years. The Classic Clean Shampoo is available in a variety of sizes, making it easy to find a bottle that suits your style.',
  brand_id: Brand.find_by(name: 'Head & Shoulders').id
}, {
  name: 'Classic Clean Conditioner',
  description: 'The Head & Shoulders Classic Clean Shampoo is a classic hair product that has been around for decades. The shampoo is known for its clean and simple design, and has been a favorite among hair enthusiasts for years. The Classic Clean Shampoo is available in a variety of sizes, making it easy to find a bottle that suits your style.',
  brand_id: Brand.find_by(name: 'Head & Shoulders').id
}]

product_data.each do |product|
  Product.find_or_create_by!(product).image.attach(io: File.open('app/data/products/white-air-max-90-1.jpg'), filename: 'white-air-max-90.jpg')
end

puts 'Products created successfully'

