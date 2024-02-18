# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Brand data
brands_data = [
    {
        name: 'Nike',
        description: 'Nike, Inc. is an American multinational corporation that is engaged in the design, development, manufacturing, and worldwide marketing and sales of footwear, apparel, equipment, accessories, and services. The company is headquartered near Beaverton, Oregon, in the Portland metropolitan area.',
        founders: 'Bill Bowerman, Phil Knight',
        image_url: 'data:image/png;base64,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',
        established_at: Date.new(1964, 1, 25),
        country: 'United States'
    },
    {
        name: 'Adidas',
        description: 'Adidas AG is a German multinational corporation, founded and headquartered in Herzogenaurach, Germany, that designs and manufactures shoes, clothing and accessories. It is the largest sportswear manufacturer in Europe, and the second largest in the world, after Nike.',
        founders: 'Adolf Dassler',
        image_url: 'data:image/png;base64,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',
        established_at: Date.new(1949, 8, 18),
        country: 'Germany'
    },
    {
        name: 'Puma',
        description: 'Puma SE, branded as Puma, is a German multinational corporation that designs and manufactures athletic and casual footwear, apparel and accessories, which is headquartered in Herzogenaurach, Bavaria, Germany. Puma is the third largest sportswear manufacturer in the world.',
        founders: 'Rudolf Dassler',
        image_url: 'data:image/png;base64,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',
        established_at: Date.new(1948, 10, 1),
        country: 'Germany'
    }
]

# Create brands
brands_data.each do |brand|
    Brand.create!(brand)
end

puts 'Brands created successfully'

# Category data
categories_data = [
  {
  name: 'Hair Products',
  description: 'High-quality hair products for all hair types, from curly to straight.',
  image_url: 'https://d2cbg94ubxgsnp.cloudfront.net/Pictures/1024x536/4/4/2/527442_gettyimages554999647_138537_crop.jpg'
  },
  {
  name: 'Accessories',
  description: 'Stylish accessories to complement your look, from head to toe.',
  image_url:
  'https://imageengine.victorinox.com/medias/?context=bWFzdGVyfHJvb3R8MTAyMTY1fGltYWdlL2pwZWd8aDZlL2g4My8xMzYwMjg3NjI5MzE1MC9zYWstcG91Y2hlc181MC1yZWN0LVMtNjQweDMyMC5qcGd8NmYyMDhiZDEwNTE1OGU2NDZhOGFmYWUyOTQzMTRmYjViYzg2NzUwNjQwNGVjMmY5NGYzOGNmMmJmZTViYTZhMg'
  },
  {
  name: 'Supplements',
  description: 'Nutritional supplements to support a healthy lifestyle.',
  image_url:
  'https://media.allure.com/photos/5bae64165f58e72d02829668/16:9/w_2560%2Cc_limit/Bright-young-things-supplements.png'
  },
  {
  name: 'Shoes',
  description: 'Comfortable shoes for all occasions and seasons, from heels to sneakers and everything in between.',
  image_url:
  'https://hips.hearstapps.com/netdoctor.cdnds.net/16/49/4000x2000/landscape-1480936823-partyshoes.jpg?resize=640:*'
  }
]

# Create categories
categories_data.each do |category|
  Category.create!(category)
end

puts 'Categories created successfully'

# Subcategory data
subcategories_data = [
  {
    name: 'Wash',
    description: 'High-quality hair wash products for all hair types. Keep your hair clean and healthy.',
    image_url: 'https://hellogiggles.com/wp-content/uploads/sites/7/2016/10/25/hairwash.jpg?quality=82&strip=1&resize=640%2C360',
    category_id: Category.find_by(name: 'Hair Products').id
  },
  {
    name: 'Extensions',
    description: 'Explore a variety of hair extensions to add length and volume to your hair.',
    image_url: 'https://divadivinehair.com/cdn/shop/articles/What_are_Weave_Hair_Extensions_Pros_and_Cons.jpg?v=1626356692&width=2048',
    category_id: Category.find_by(name: 'Hair Products').id
  },
  {
    name: 'Jewellery',
    description: 'Discover the latest trends in fashionable jewelry to enhance your style.',
    image_url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnqcVkZI9rqb8uE54YHYm6Jl8vo5FjIiOgyg&usqp=CAU',
    category_id: Category.find_by(name: 'Accessories').id
  },
  {
    name: 'Hats',
    description: 'Stay stylish with a wide range of hats for different occasions and seasons.',
    image_url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfhchnH7d25dJauyBjMiLeayNg7T7aIBn_3Q&usqp=CAU',
    category_id: Category.find_by(name: 'Accessories').id
  },
  {
    name: 'Bags',
    description: 'Explore our collection of trendy and functional bags for all your needs.',
    image_url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOu1kJeB9iRMlJAQ2I1TOfBbbMDPaPxdhS9w&usqp=CAU',
    category_id: Category.find_by(name: 'Accessories').id
  },
  {
    name: 'Heels',
    description: 'Elevate your style with a stunning range of high heels for various occasions.',
    image_url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMlp1fqkh6F7f90tBm05YiQpV1dHxOsSZ1cA&usqp=CAU',
    category_id: Category.find_by(name: 'Shoes').id
  },
  {
    name: 'Sneakers',
    description: 'Stay comfortable and trendy with our collection of stylish sneakers for men and women.',
    image_url: 'https://img.etimg.com/thumb/width-640,height-480,imgsize-6214,resizemode-75,msid-103256086/top-trending-products/lifestyle/sneakers-for-men-under-5000/images-.jpg_',
    category_id: Category.find_by(name: 'Shoes').id
  },
  {
    name: 'Nutrients',
    description: 'Support your health with essential nutrients and vitamins. Choose from a variety of supplements.',
    image_url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzuEbXdZN2-adkYlDf38ajKjEugbP_dMXF_w&usqp=CAU',
    category_id: Category.find_by(name: 'Supplements').id
  },
  {
    name: 'Diet',
    description: 'Explore dietary supplements to help you achieve your health and fitness goals.',
    image_url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTC80yuZxDYodjVUqb5iWRXNDsCOeye7JGsg&usqp=CAU',
    category_id: Category.find_by(name: 'Supplements').id
  },
  {
    name: 'Body',
    description: 'Discover supplements for overall body health and well-being.',
    image_url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmmrX6Ug24V-cLl673d0h076v0DEY2BoDvtg&usqp=CAU',
    category_id: Category.find_by(name: 'Supplements').id
  }
]

# Create subcategories
subcategories_data.each do |subcategory|
  Category.create!(subcategory)
end

puts 'Subcategories created successfully'

#Seed data for images
images =
['data:image/jpeg;base64,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',
'data:image/jpeg;base64,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',
'data:image/jpeg;base64,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']

ProductColor.all.each do |product_color|
images.each do |image|
ProductColorImage.create(product_color_id: product_color.id, image_url: image)
end
end

puts 'Product color images created successfully'

# Product data
products_data = [
  {
    name: 'Air Max 90',
    description: 'The Nike Air Max 90 stays true to its OG running roots with its iconic Waffle outsole, stitched overlays and classic, color-accented TPU plates. Retro colors celebrate the first generation while Max Air cushioning adds comfort to your journey.',
    brand_id: Brand.find_by(name: 'Nike').id
  },
  {
    name: 'Air Force 1',
    description: 'The Nike Air Force 1 07 LV8 incorporates the same hoops-inspired performance features of the 1982 original while adding fresh design details for a sleek look.',
    brand_id: Brand.find_by(name: 'Nike').id
  },
  {
    name: 'Forum 84 Low',
    description: 'The adidas Forum 84 Low shoes bring back the classic look of the original with a streamlined silhouette and a low-profile design. The leather upper and suede toe cap give them a soft, supple feel.',
    brand_id: Brand.find_by(name: 'Adidas').id
  },
  {
    name: 'Stan Smith',
    description: 'The Stan Smith has been a streetwear staple since the early 1970s. This version of the iconic shoes puts a fresh spin on the classic look with a leather upper that shows off a bold animal print.',
    brand_id: Brand.find_by(name: 'Adidas').id
  },
  {
    name: 'Shuffle',
    description: 'The Shuffle is a classic low-top sneaker with a timeless silhouette. It features a durable canvas upper, a padded collar for comfort, and a rubber sole for grip.',
    brand_id: Brand.find_by(name: 'Puma').id
  }
]

# Create products
products_data.each do |product_data|
  Product.create!(product_data)
end

puts 'Products created successfully'

# Material data
materials_data = [
  {
    name: 'Leather',
    description: 'Leather is a durable and flexible material created by tanning animal rawhide and skins. The most common raw material is cattle hide. It can be produced at manufacturing scales ranging from artisan to modern industrial scale.',
    cleaning_instructions: 'Wipe with a damp cloth, do not wash',
    youtube_link: 'https://www.youtube.com/shorts/ly2u6dY8FbM'
  },
  {
    name: 'Suede',
    description: 'Suede is a type of leather with a napped finish, commonly used for jackets, shoes, shirts, purses, furniture, and other items. The term comes from the French "gants de Suède", which literally means "gloves from Sweden".',
    cleaning_instructions: 'Use a suede brush to remove dirt and debris, then use a suede eraser to remove stains',
    youtube_link: 'https://www.youtube.com/shorts/Kz3HEN9ENiw'
  },
  {
    name: 'Canvas',
    description: 'Canvas is an extremely durable plain-woven fabric used for making sails, tents, marquees, backpacks, and other items for which sturdiness is required. It is also popularly used by artists as a painting surface, typically stretched across a wooden frame.',
    cleaning_instructions: 'Use a soft brush to remove dirt and debris, then use a damp cloth to wipe the canvas',
    youtube_link: 'https://www.youtube.com/shorts/m4nDkZwI8Wg'
  },
  {
    name: 'Velvet',
    description: 'Velvet is a type of woven tufted fabric in which the cut threads are evenly distributed, with a short dense pile, giving it a distinctive soft feel. By extension, the word velvety means "smooth like velvet."',
    cleaning_instructions: 'Use a soft brush to remove dirt and debris, then use a damp cloth to wipe the velvet',
    youtube_link: 'https://www.youtube.com/shorts/M54JeCssMM8'
  },
  {
    name: 'Cotton',
    description: 'Cotton is a soft, fluffy staple fiber that grows in a boll, or protective case, around the seeds of the cotton plants of the genus Gossypium in the mallow family Malvaceae. The fiber is almost pure cellulose.',
    cleaning_instructions: 'Machine wash in cold water, tumble dry on low heat',
    youtube_link: 'https://www.youtube.com/shorts/O90hKrYrBJo'
  }
]

# Create materials
materials_data.each do |material_data|
  Material.create!(material_data)
end

puts 'Materials created successfully'

# ProductMaterial data
product_materials_data = [
  {
    product_id: Product.find_by(name: 'Air Max 90').id,
    material_id: Material.find_by(name: 'Leather').id
  },
  {
    product_id: Product.find_by(name: 'Air Max 90').id,
    material_id: Material.find_by(name: 'Canvas').id
  },
  {
    product_id: Product.find_by(name: 'Air Force 1').id,
    material_id: Material.find_by(name: 'Leather').id
  },
  {
    product_id: Product.find_by(name: 'Air Force 1').id,
    material_id: Material.find_by(name: 'Canvas').id
  },
  {
    product_id: Product.find_by(name: 'Forum 84 Low').id,
    material_id: Material.find_by(name: 'Suede').id
  },
  {
    product_id: Product.find_by(name: 'Forum 84 Low').id,
    material_id: Material.find_by(name: 'Leather').id
  },
  {
    product_id: Product.find_by(name: 'Stan Smith').id,
    material_id: Material.find_by(name: 'Leather').id
  },
  {
    product_id: Product.find_by(name: 'Stan Smith').id,
    material_id: Material.find_by(name: 'Canvas').id
  },
  {
    product_id: Product.find_by(name: 'Shuffle').id,
    material_id: Material.find_by(name: 'Canvas').id
  },
  {
    product_id: Product.find_by(name: 'Shuffle').id,
    material_id: Material.find_by(name: 'Velvet').id
  }
]

# Create product_materials
product_materials_data.each do |product_material_data|
  ProductMaterial.create!(product_material_data)
end

puts 'ProductMaterials created successfully'

# CategoryProduct data
category_products_data = [
  {
    product_id: Product.find_by(name: 'Air Max 90').id,
    category_id: Category.find_by(name: 'Shoes').id
  },
  {
    product_id: Product.find_by(name: 'Air Force 1').id,
    category_id: Category.find_by(name: 'Shoes').id
  },
  {
    product_id: Product.find_by(name: 'Forum 84 Low').id,
    category_id: Category.find_by(name: 'Shoes').id
  },
  {
    product_id: Product.find_by(name: 'Stan Smith').id,
    category_id: Category.find_by(name: 'Shoes').id
  },
  {
    product_id: Product.find_by(name: 'Shuffle').id,
    category_id: Category.find_by(name: 'Shoes').id
  }
]

# Create category_products
category_products_data.each do |category_product_data|
  CategoryProduct.create!(category_product_data)
end

puts 'CategoryProducts created successfully'

# ProductSize data
product_sizes_data = [
  {
    product_id: Product.find_by(name: 'Air Max 90').id,
    US: 7,
    UK: 6,
    EU: 40,
    CM: 25,
    price: 150
  },
  {
    product_id: Product.find_by(name: 'Air Max 90').id,
    US: 8,
    UK: 7,
    EU: 41,
    CM: 26,
    price: 150
  },
  {
    product_id: Product.find_by(name: 'Air Max 90').id,
    US: 9,
    UK: 8,
    EU: 42,
    CM: 27,
    price: 150
  },
  {
    product_id: Product.find_by(name: 'Air Max 90').id,
    US: 10,
    UK: 9,
    EU: 43,
    CM: 28,
    price: 150
  },
  {
    product_id: Product.find_by(name: 'Air Force 1').id,
    US: 7,
    UK: 6,
    EU: 40,
    CM: 25,
    price: 100
  },
  {
    product_id: Product.find_by(name: 'Air Force 1').id,
    US: 8,
    UK: 7,
    EU: 41,
    CM: 26,
    price: 100
  },
  {
    product_id: Product.find_by(name: 'Air Force 1').id,
    US: 9,
    UK: 8,
    EU: 42,
    CM: 27,
    price: 100
  },
  {
    product_id: Product.find_by(name: 'Air Force 1').id,
    US: 10,
    UK: 9,
    EU: 43,
    CM: 28,
    price: 100
  },
  {
    product_id: Product.find_by(name: 'Forum 84 Low').id,
    US: 7,
    UK: 6,
    EU: 40,
    CM: 25,
    price: 120
  },
  {
    product_id: Product.find_by(name: 'Stan Smith').id,
    US: 9,
    UK: 8,
    EU: 42,
    CM: 27,
    price: 90
  },
  {
    product_id: Product.find_by(name: 'Shuffle').id,
    US: 7,
    UK: 6,
    EU: 40,
    CM: 25,
    price: 80
  }
]

# Create product_sizes
product_sizes_data.each do |product_size_data|
  ProductSize.create!(product_size_data)
end

puts 'ProductSizes created successfully'

# ProductColor data
product_colors_data = [
  {
    product_size_id: ProductSize.find_by(US: 7, product_id: Product.find_by(name: 'Air Max 90').id).id,
    color: 'White',
    stock: 10
  },
  {
    product_size_id: ProductSize.find_by(US: 8, product_id: Product.find_by(name: 'Air Max 90').id).id,
    color: 'Navy',
    stock: 7
  },
  {
    product_size_id: ProductSize.find_by(US: 9, product_id: Product.find_by(name: 'Air Force 1').id).id,
    color: 'Black',
    stock: 3
  },
  {
    product_size_id: ProductSize.find_by(US: 7, product_id: Product.find_by(name: 'Forum 84 Low').id).id,
    color: 'Pink',
    stock: 5
  },
  {
    product_size_id: ProductSize.find_by(US: 9, product_id: Product.find_by(name: 'Stan Smith').id).id,
    color: 'Green',
    stock: 2
  },
  {
    product_size_id: ProductSize.find_by(US: 7, product_id: Product.find_by(name: 'Shuffle').id).id,
    color: 'Red',
    stock: 8
  },
  {
    product_size_id: ProductSize.find_by(US: 7, product_id: Product.find_by(name: 'Shuffle').id).id,
    color: 'Black',
    stock: 6
  }
]

# Create product_colors
product_colors_data.each do |product_color_data|
  ProductColor.create!(product_color_data)
end

puts 'ProductColors created successfully'

# ProductColorImage data

ProductColor.all.each do |product_color|
  ['data:image/jpeg;base64,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',
  'data:image/jpeg;base64,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', 
  'data:image/jpeg;base64,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'].each do |view|
    ProductColorImage.create!(
      product_color_id: product_color.id,
      image_url: view
    )
  end
end

puts 'Product color images created successfully'