# Product category model data

product_category_data = [{
  product_id: Product.find_by(name: 'Air Max 90').id,
  category_id: Category.find_by(name: 'Sneakers').id
}, {
  product_id: Product.find_by(name: 'Air Max 90').id,
  category_id: Category.find_by(name: 'Shoes').id
}, {
  product_id: Product.find_by(name: 'Air Force 1').id,
  category_id: Category.find_by(name: 'Sneakers').id
}, {
  product_id: Product.find_by(name: 'Air Force 1').id,
  category_id: Category.find_by(name: 'Shoes').id
}, {
  product_id: Product.find_by(name: 'Superstar').id,
  category_id: Category.find_by(name: 'Sneakers').id
}, {
  product_id: Product.find_by(name: 'Superstar').id,
  category_id: Category.find_by(name: 'Shoes').id
}, {
  product_id: Product.find_by(name: 'Stan Smith').id,
  category_id: Category.find_by(name: 'Sneakers').id
}, {
  product_id: Product.find_by(name: 'Stan Smith').id,
  category_id: Category.find_by(name: 'Shoes').id
}, {
  product_id: Product.find_by(name: 'Suede').id,
  category_id: Category.find_by(name: 'Sneakers').id
}, {
  product_id: Product.find_by(name: 'Suede').id,
  category_id: Category.find_by(name: 'Shoes').id
}, {
  product_id: Product.find_by(name: 'Clyde').id,
  category_id: Category.find_by(name: 'Sneakers').id
}, {
  product_id: Product.find_by(name: 'Clyde').id,
  category_id: Category.find_by(name: 'Shoes').id
}, {
  product_id: Product.find_by(name: 'Curry 8').id,
  category_id: Category.find_by(name: 'Sneakers').id
}, {
  product_id: Product.find_by(name: 'Curry 8').id,
  category_id: Category.find_by(name: 'Shoes').id
}, {
  product_id: Product.find_by(name: 'Onthego GM').id,
  category_id: Category.find_by(name: 'Bags').id
}, {
  product_id: Product.find_by(name: 'Onthego GM').id,
  category_id: Category.find_by(name: 'Accessories').id
}, {
  product_id: Product.find_by(name: 'Neverfull MM').id,
  category_id: Category.find_by(name: 'Bags').id
}, {
  product_id: Product.find_by(name: 'Neverfull MM').id,
  category_id: Category.find_by(name: 'Accessories').id
}, {
  product_id: Product.find_by(name: 'GG Marmont').id,
  category_id: Category.find_by(name: 'Bags').id
}, {
  product_id: Product.find_by(name: 'GG Marmont').id,
  category_id: Category.find_by(name: 'Accessories').id
}, {
  product_id: Product.find_by(name: 'Soho Disco').id,
  category_id: Category.find_by(name: 'Bags').id
}, {
  product_id: Product.find_by(name: 'Soho Disco').id,
  category_id: Category.find_by(name: 'Accessories').id
}, {
  product_id: Product.find_by(name: 'Mr Daddy 2.0').id,
  category_id: Category.find_by(name: 'Jewellery').id
}, {
  product_id: Product.find_by(name: 'Mr Daddy 2.0').id,
  category_id: Category.find_by(name: 'Accessories').id
}, {
  product_id: Product.find_by(name: 'Mega Chief').id,
  category_id: Category.find_by(name: 'Jewellery').id
}, {
  product_id: Product.find_by(name: 'Mega Chief').id,
  category_id: Category.find_by(name: 'Accessories').id
}, {
  product_id: Product.find_by(name: 'Classic Tennis Bracelet').id,
  category_id: Category.find_by(name: 'Jewellery').id
}, {
  product_id: Product.find_by(name: 'Classic Tennis Bracelet').id,
  category_id: Category.find_by(name: 'Accessories').id
}, {
  product_id: Product.find_by(name: 'Diamond Studs').id,
  category_id: Category.find_by(name: 'Jewellery').id
}, {
  product_id: Product.find_by(name: 'Diamond Studs').id,
  category_id: Category.find_by(name: 'Accessories').id
}, {
  product_id: Product.find_by(name: 'Formula 1').id,
  category_id: Category.find_by(name: 'Diet').id
}, {
  product_id: Product.find_by(name: 'Formula 1').id,
  category_id: Category.find_by(name: 'Supplements').id
}, {
  product_id: Product.find_by(name: 'Protein Delite').id,
  category_id: Category.find_by(name: 'Diet').id
}, {
  product_id: Product.find_by(name: 'Protein Delite').id,
  category_id: Category.find_by(name: 'Supplements').id
}, {
  product_id: Product.find_by(name: 'Brazzilian Extension').id,
  category_id: Category.find_by(name: 'Hair Products').id
}, {
  product_id: Product.find_by(name: 'Brazzilian Extension').id,
  category_id: Category.find_by(name: 'Extensions').id
}, {
  product_id: Product.find_by(name: 'Curly Extension').id,
  category_id: Category.find_by(name: 'Hair Products').id
}, {
  product_id: Product.find_by(name: 'Curly Extension').id,
  category_id: Category.find_by(name: 'Extensions').id  
}, {
  product_id: Product.find_by(name: 'Classic Clean Shampoo').id,
  category_id: Category.find_by(name: 'Hair Products').id
}, {
  product_id: Product.find_by(name: 'Classic Clean Shampoo').id,
  category_id: Category.find_by(name: 'Wash').id
}, {
  product_id: Product.find_by(name: 'Classic Clean Conditioner').id,
  category_id: Category.find_by(name: 'Hair Products').id
}, {
  product_id: Product.find_by(name: 'Classic Clean Conditioner').id,
  category_id: Category.find_by(name: 'Wash').id
}]

# Create product category data
product_category_data.each do |data|
  ProductCategory.find_or_create_by!(data)
end

puts 'Product category data has been created'

