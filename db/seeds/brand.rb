
brand_data = [{
  name: 'Nike',
  description: 'An American multinational corporation that is engaged in the design, development, manufacturing, and worldwide marketing and sales of footwear, apparel, equipment, accessories, and services. The company is headquartered near Beaverton, Oregon, in the Portland metropolitan area.',
  image: 'nike-logo.jpg',
  established_at: '1964-01-25',
  founders: 'Bill Bowerman, Phil Knight',
  country: 'United States'
}, {
  name: 'Adidas',
  description: 'A German multinational corporation, founded and headquartered in Herzogenaurach, Germany, that designs and manufactures shoes, clothing and accessories. It is the largest sportswear manufacturer in Europe, and the second largest in the world, after Nike.',
  image: 'adidas-logo.jpg',
  established_at: '1949-08-18',
  founders: 'Adolf Dassler',
  country: 'Germany'
}, {
  name: 'Puma',
  description: 'A German multinational corporation that designs and manufactures athletic and casual footwear, apparel and accessories, which is headquartered in Herzogenaurach, Bavaria, Germany. Puma is the third largest sportswear manufacturer in the world.',
  image: 'puma-logo.jpg',
  established_at: '1948-10-01',
  founders: 'Rudolf Dassler',
  country: 'Germany'
}, {
  name: 'Under Armour',
  description: 'An American company that manufactures footwear, sports, and casual apparel. Under Armour\'s global headquarters are located in Baltimore, Maryland with additional North American corporate office locations in Austin and Houston, Texas; Denver, Colorado; New York, New York; San Francisco, California; Portland, Oregon; Nashville, Tennessee; and Toronto, Ontario.',
  image: 'under-armour-logo.png',
  established_at: '1996-09-25',
  founders: 'Kevin Plank',
  country: 'United States'
}, {
  name: 'Louis Vuitton',
  description: 'A French fashion house and luxury goods company, which is headquartered in Paris, France. The company is a division of the LVMH conglomerate and operates in 50 countries with more than 460 stores worldwide.',
  image: 'louis-vuitton-logo.png',
  established_at: '1854-01-01',
  founders: 'Louis Vuitton',
  country: 'France'
}, {
  name: 'Gucci',
  description: 'An Italian luxury brand of fashion and leather goods. Gucci was founded by Guccio Gucci in Florence, Tuscany, in 1921. Gucci generated about €4.2 billion in revenue worldwide in 2008 according to BusinessWeek and climbed to 41st position in the magazine\'s annual 2009 "Top Global 100 Brands" chart created by Interbrand.',
  image: 'gucci-logo.png',
  established_at: '1921-01-01',
  founders: 'Guccio Gucci',
  country: 'Italy'
}, {
  name: 'Calvin Klein',
  description: 'An American fashion house established in 1968. It specializes in leather, lifestyle accessories, home furnishings, perfumery, jewellery, watches and ready-to-wear. The company has substantial market share in retail and commercial lines as well haute couture garments.',
  image: 'ck-logo.png',
  established_at: '1968-01-01',
  founders: 'Calvin Klein',
  country: 'United States'
}, {
  name: 'Head & Shoulders',
  description: 'An American brand of anti-dandruff and non-dandruff shampoo produced by parent company Procter & Gamble that was introduced in 1961.
  The brand was first introduced by Procter & Gamble in 1961. It was developed as a successor to the brand\'s previous anti-dandruff shampoo, Prell. Head & Shoulders is the world\'s number one anti-dandruff shampoo.',
  image: 'head-shoulder-logo.png',
  established_at: '1961-01-01',
  founders: 'Procter & Gamble',
  country: 'United States'
}, {
  name: 'Prada',
  description: 'An Italian luxury fashion house, specializing in leather handbags, travel accessories, shoes, ready-to-wear, perfumes and other fashion accessories, founded in 1913 by Mario Prada.',
  image: 'prada-logo.png',
  established_at: '1913-01-01',
  founders: 'Mario Prada',
  country: 'Italy'
}, {
  name: 'Diesel',
  description: 'An Italian retail clothing company, located in Breganze, Italy. It sells denim, and other clothing, footwear, and accessories. The clothing line has two different brands: Diesel and Diesel Black Gold. There\'s also a line for children, called Diesel Kid.',
  image: 'diesel-logo.png',
  established_at: '1978-01-01',
  founders: 'Renzo Rosso',
  country: 'Italy'
}, {
  name: 'Vrai',
  description: 'A French brand of jewelry. The brand was founded in 2019 by Vanessa Stofenmacher. The brand is known for its high-quality jewelry, and is one of the most popular jewelry brands in France.',
  image: 'vrai-logo.png',
  established_at: '2019-01-01',
  founders: 'Vanessa Stofenmacher',
  country: 'France'
}, {
  name: 'Herbal Life',
  description: 'An American multi-level marketing company that sells dietary supplements. The company was founded by Mark Hughes in 1980, and it employs an estimated 8,900 people worldwide.',
  image: 'herbal-life-logo.jpg',
  established_at: '1980-01-01',
  founders: 'Mark Hughes',
  country: 'United States'
}, {
  name: 'USN',
  description: 'A South African brand of dietary supplements. The brand was founded in 1999 by Albé Geldenhuys. The brand is known for its high-quality dietary supplements, and is one of the most popular dietary supplement brands in South Africa.',
  image: 'usn-logo.png',
  established_at: '1999-01-01',
  founders: 'Albé Geldenhuys',
  country: 'South Africa'
}, {
  name: 'Bellami',
  description: 'An American brand of hair extensions. The brand was founded in 2012 by Nikki Eslami. The brand is known for its high-quality hair extensions, and is one of the most popular hair extension brands in the United States.',
  image: 'bellami-logo.png',
  established_at: '2012-01-01',
  founders: 'Nikki Eslami',
  country: 'United States'
}]

brand_data.each do |brand|
  Brand.find_or_create_by!(name: brand[:name], description: brand[:description], established_at: brand[:established_at], founders: brand[:founders], country: brand[:country]).logo.attach(io: File.open(Rails.root.join('app/data/brands', brand[:image])), filename: brand[:name].downcase + '-logo.png')
end

puts 'Brands created successfully'

