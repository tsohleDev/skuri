
category_data = [{
  name: 'Shoes',
  description: 'A shoe is an item of footwear intended to protect and comfort the human foot. Shoes are also used as an item of decoration and fashion. The design of shoes has varied enormously through time and from culture to culture, with appearance originally being tied to function.',
  image: 'shoes-category.jpg'
}, {
  name: 'Hair Products',
  description: 'Hair care is an overall term for hygiene and cosmetology involving the hair which grows from the human scalp, and to a lesser extent facial, pubic and other body hair. Hair care routines differ according to an individual\'s culture and the physical characteristics of one\'s hair.',
  image: 'hair-category.jpg'
}, {
  name: 'Supplements',
  description: 'A dietary supplement is a manufactured product intended to supplement one\'s diet by taking a pill, capsule, tablet, powder, or liquid. A supplement can provide nutrients either extracted from food sources or synthetic, individually or in combination, in order to increase the quantity of their consumption.',
  image: 'supplements-category.jpg'
}, {
  name: 'Accessories',
  description: 'An accessory is a person who assists in the commission of a crime, but who does not actually participate in the commission of the crime as a joint principal. The distinction between an accessory and a principal is a question of fact and degree: a person may be held to be an accessory even though he did not know that a crime was being committed.',
  image: 'accessories-category.jpg'
}]

category_data.each do |category|
  Category.find_or_create_by!(name: category[:name], description: category[:description]).image.attach(io: File.open(Rails.root.join('app/data/categories', category[:image])), filename: category[:name].downcase + '-category.jpg')
end

puts 'Categories created successfully'

